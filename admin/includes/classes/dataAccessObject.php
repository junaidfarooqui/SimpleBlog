<?php

/**
 * Class DataAccessObject
 */
class DataAccessObject {

    private $conn;

    public function __construct() {
        $this->conn = new mysqli('localhost', 'newsbloguser', 'newsbloguser', 'newsblog');

        if ($this->conn->connect_error) {
            die("Connection failed: " . $this->conn->connect_error);
        }
    }

    public function connect()
    {
        return $this->conn;
    }

    public function getAllRecords($table)
    {
        $sql = "SELECT * FROM $table";
        $result = $this->conn->query($sql);

        if ($result->num_rows > 0) {
            $data = array();
            while ($row = $result->fetch_assoc()) {
                $data[] = $row;
            }
            return $data;
        } else {
            return null;
        }
    }

    public function getArticles($page = 1, $perPage = 5) {
        $start = ($page - 1) * $perPage;

        // Get the total number of records
        $stmt_count = $this->conn->prepare("SELECT COUNT(*) as count FROM articles");
        $stmt_count->execute();
        $count_result = $stmt_count->get_result();
        $count_row = $count_result->fetch_assoc();
        $total_records = $count_row['count'];

        // Retrieve the articles for the specified page
        $stmt = $this->conn->prepare("SELECT * FROM articles LIMIT ?, ?");
        $stmt->bind_param('ii', $start, $perPage);
        $stmt->execute();
        $result = $stmt->get_result();

        $articles = array();
        while ($row = $result->fetch_assoc()) {
            $articles[] = $row;
        }

        // Return the total record count to the result array
        return array(
            'articles' => $articles,
            'total_records' => $total_records
        );
    }

    public function getArticleBySlug($slug)
    {
        // Prepare the query
        $stmt = $this->conn->prepare('SELECT * FROM articles WHERE slug = ?');
        if (!$stmt) {
            // Print out the full error message and handle the error appropriately
            $error = $this->conn->error;
            echo 'Error preparing SQL query: ' . $error;
            // Handle the error appropriately
        }

        $stmt->bind_param('s', $slug);
        $stmt->execute();
        $result = $stmt->get_result();
        $article = $result->fetch_assoc();

        if (!$article) {
            return 'Article not found.';
        } else {
           return $article;
        }
    }

    public function addComment($data)
    {
        $name = $data['name'];
        $headline = $data['headline'];
        $email = $data['inputEmail'];
        $content = mysqli_real_escape_string($this->conn, $data['content']);
        $status = $data['status'];
        $author_id = !empty($data['id']) ? $data['id'] : NULL;
        $article_id = $data['articleId'];
        $reference_id = !empty($data['referenceId']) ? intval($data['referenceId']) : NULL;

        $sql = "INSERT INTO comments (name, headline, email, content, status, author_id, article_id, reference_id)
        VALUES ('$name', '$headline', '$email', '$content', '$status', '$author_id', '$article_id', '$reference_id')";

        // execute the query using your database connection
        $result = $this->conn->query($sql);

        if ($result === false) {
            $error = $this->conn->error;
            $status = 'error';
            $message = "Error executing query: $error";
        } else {
            $status = 'ok';
            $message = $data;
        }

     return [
         'status' => $status,
         'message' => $message
     ];
    }

    public function commentListByArticleId($articleId) {
        $stmt = $this->conn->prepare("SELECT * FROM comments WHERE article_id = ? AND status = 'approved' ORDER BY id");
        $stmt->bind_param("i", $articleId);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $comments = array();
            while ($row = $result->fetch_assoc()) {
                if ($row['reference_id'] == null) {
                    // this is a top-level comment
                    $comment = $row;
                    $comment['replies'] = array();

                    $comments[] = $comment;
                } else {
                    // this is a reply to a previous comment
                    foreach ($comments as &$parentComment) {
                        if ($parentComment['id'] == $row['reference_id']) {
                            $childComment = $row;
                            $parentComment['replies'][] = $childComment;
                        }
                    }
                }
            }
            return $comments;
        } else {
            return null;
        }
    }

    public function closeConnection()
    {
        $this->conn->close();
    }

    public function getRecordById($table, $id) {
        $sql = "SELECT * FROM $table WHERE id=$id";
        $result = $this->conn->query($sql);

        if ($result->num_rows > 0) {
            return $result->fetch_assoc();
        } else {
            return null;
        }
    }

    /**
     * sanitizeUrl
     * @param $url
     * @return string
     */
    public function sanitizeUrl($url)
    {
        $slug = strtolower($url);
        $slug = preg_replace('/[^a-zA-Z0-9]+/', '-', $slug);
        $slug = trim($slug, '-');

        return $slug;
    }

    public function arrayToString($array)
    {
        $result = '';

        foreach ($array as $key => $item) {
            if ($key === key(array_slice($array, -1, 1))) {
                $result .= $item;
            } else {
                $result .= ', ' . $item;
            }
        }

        return $result;
    }

    public function getCategoriesNameById($categoriesId)
    {
        $categoryNames = '';
        $categoriesIdArray = explode(',', $categoriesId);
        foreach ($categoriesIdArray as $key => $id){
            $category = $this->getRecordById('categories', $id);
            if ($key === key(array_slice($categoriesIdArray, -1, 1))) {
                $categoryNames .= $category['name'];
            } else {
                $categoryNames .= ', ' . $category['name'];
            }
        }

        return $categoryNames;
    }

    public function getCategoriesHtml($categories, $articleId = null)
    {
        $categoryTree = array();

        foreach ($categories as $category) {
            // If the category has no parent, add it to the top level of the hierarchy
            if ($category['parent_id'] === null || empty($category['parent_id'])) {
                $categoryTree[$category['id']] = $category;
            } else {
                // Otherwise, add it as a child of its parent category
                $categoryTree[$category['parent_id']]['children'][$category['id']] = $category;
            }
        }

        $activeCategories = '';
        if ($articleId) {
            $article = $this->getRecordById('articles', $articleId);
            $activeCategories = $article['category_ids'];
        }

        return $this->createCheckboxTree($categoryTree, $activeCategories);
    }

    public function createCheckboxTree($categories, $activeCategoriesString = '', $parent_id = null) {
        $html = '';
        $activeCategories = explode(',', $activeCategoriesString); // Convert string to array
        foreach ($categories as $category) {
            if ($category['parent_id'] == $parent_id) {
                $isActive = in_array(intval($category['id']), $activeCategories); // Check if category ID is active
                if (!$isActive && isset($category['children'])) {
                    $isActive = $this->isCategoryActive($category['children'], $activeCategories); // Check if any child category ID is active
                }
                $html .= '<li class="list-item"><label>';
                $html .= '<input class="form-check-input me-1" type="checkbox" name="categories[]" value="' . $category['id'] . '"' . ($isActive ? ' checked' : '') . '> ' . $category['name']; // Add 'checked' attribute if category ID is active
                if (isset($category['children'])) {
                    $html .= '<ul>' . $this->createCheckboxTree($category['children'], $activeCategoriesString, $category['id']) . '</ul>'; // Pass $activeCategories instead of $activeCategoriesString
                }
                $html .= '</label></li>';
            }
        }
        return $html;
    }

    public function isCategoryActive($children, $activeCategories) {
        foreach ($children as $child) {
            $isActive = in_array($child['id'], $activeCategories); // Check if child category ID is active
            if ($isActive || (isset($child['children']) && $this->isCategoryActive($child['children'], $activeCategories))) { // Recursively check for child's descendants
                return true;
            }
        }
        return false;
    }

}

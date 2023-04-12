<?php
include_once ('../../includes/config.php');
session_start();
if(!isset($_SESSION['user_id'])) {
    header('Location: ' . HOSTNAME . '/login.php');
    exit;
}

$dataObject = new DataAccessObject();
$conn = $dataObject->connect();

// get the form data
$articleId = $_POST['article_id'];
$title = $_POST['title'];
$slug = $dataObject->sanitizeUrl($_POST['title']);
$content = mysqli_real_escape_string($conn, $_POST['content']);
$category = $dataObject->arrayToString($_POST['categories']);
$meta_keywords = $_POST['meta_keywords'];
$meta_description = $_POST['meta_description'];
$authorId = $_POST['user_id'];

if(empty($_POST['image_url'])) {
    // Upload Image
    $target_dir = "../uploads/";
    $target_file = $target_dir . basename($_FILES["image"]["name"]);
    $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
        && $imageFileType != "gif" ) {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        exit;
    }
    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
        echo "The file ". htmlspecialchars( basename( $_FILES["image"]["name"])). " has been uploaded.";
    } else {
        echo "Sorry, there was an error uploading your file.";
        exit;
    }
} else {
    $target_file = $_POST['image_url'];
}

if(!empty($articleId)) {
    // Update the article in the database
    $sql = "UPDATE articles SET title = '$title', content = '$content', meta_keyword = '$meta_keywords', meta_description = '$meta_description', category_ids = '$category', image_url = '$target_file' WHERE id = '$articleId'";
} else {
    // Insert the article in the database
    $sql = "INSERT INTO articles (title, slug, content, image_url, author_id, meta_keyword, meta_description, category_ids)
VALUES ('$title', '$slug', '$content', '$target_file', '$authorId', '$meta_keywords', '$meta_description', '$category')";
}

if ($conn->query($sql) === TRUE) {
    if(!empty($articleId)) {
        // redirect the user to the category list page
        header("Location: ../article.php?id=" . $articleId);
    } else {
        // redirect the user to the category list page
        header("Location: ../articleList.php");
    }
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();

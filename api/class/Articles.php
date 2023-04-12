<?php
include_once ('../includes/config.php');

class Articles {
    public function dataObject()
    {
        return new DataAccessObject();
    }

    public function prepareArticleDetailApiData($slug)
    {
        $articleData = $this->dataObject()->getArticleBySlug($slug);

        return $this->getArticlePreparedData($articleData);
    }

    public function getArticleDetails($slug)
    {
        return $this->prepareArticleDetailApiData($slug);
    }

    public function getArticlesList($page , $perPage)
    {
        $articlesData = $this->dataObject()->getArticles($page , $perPage);
        $articlesList = $articlesData['articles'];
        $formattedArticles = [];
        foreach ($articlesList as $article) {
            array_push($formattedArticles, $this->getArticlePreparedData($article));
        }

        return [
            'articles' => $formattedArticles,
            'total_records' => $articlesData['total_records']
        ];
    }

    public function getArticlePreparedData($article)
    {
        // Image Full URL
        $article['image_url'] = $this->getImageFullUrl($article['image_url']);

        // Replace category Ids with names
        $article['categories'] = $this->dataObject()->getCategoriesNameById($article['category_ids']);

        // Replace Date
        $article['date_created'] = $this->getFormattedDate($article['date_created']);

        // Author Name
        $article['author_name'] = $this->getAuthorName($article['author_id']);

        return $article;
    }

    public function getImageFullUrl($imageUrl)
    {
        $imageUrlArray = pathinfo($imageUrl);
        $imageName = $imageUrlArray['basename'];

        return UPLOAD_DIR . $imageName;
    }

    public function getFormattedDate($date)
    {
        $articleDate = explode(' ', $date);
        $dateCreate = date_create($articleDate[0]);

        return date_format($dateCreate,"d F Y");
    }

    public function getAuthorName($authorId)
    {
        $authorData = $this->dataObject()->getRecordById('users', $authorId);
        return $authorData['first_name'] . ' ' . $authorData['last_name'];
    }
}
<?php require_once ('../includes/config.php'); ?>
<?php
session_start();

if(!isset($_SESSION['user_id'])) {
    header('Location: ' . HOSTNAME . '/login.php');
    exit;
}
$dataObject = new DataAccessObject();
$allCategories = $dataObject->getAllRecords('categories');
$articleId = !empty($_GET['id']) ? $_GET['id'] : '';
$articleObject = array();

if ($articleId) {
    $articleObject = $dataObject->getRecordById('articles', $articleId);
}

$imageUrl = count($articleObject) > 0 ? $articleObject['image_url'] : '';
if (!empty($imageUrl)) {
    $imageFullUrl = HOSTNAME . '/admin/uploads/' . basename($imageUrl);
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Create Blog Article</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

<?php require_once ('./includes/head.php'); ?>
</head>

<body>
<?php require_once ('./includes/header.php'); ?>
<?php require_once ('./includes/sidebar.php'); ?>
    <main id="main" class="main">

    <div class="pagetitle">
        <h1>Create Blog Article <?php echo $_SESSION['user_id']; ?></h1>
    </div>
        <!-- End Page Title -->

    <section class="section">
        <form method="post" action="./includes/addArticle.php" enctype="multipart/form-data">
            <input type="hidden" name="user_id" value="<?php echo $_SESSION['user_id']; ?>">
            <input type="hidden" name="article_id" value="<?php echo !empty($_GET['id']) ? $_GET['id'] : ''; ?>">
            <input type="hidden" name="image_url" value="<?php echo $imageUrl; ?>">
            <div class="row">
                <div class="col-lg-8">
                  <div class="card">
                      <div class="card-body pt-2">
                          <div class="row my-3">
                              <label for="title" class="col-sm-2 col-form-label">Title:</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" id="title" name="title" value="<?php echo !empty($articleObject['title']) ? $articleObject['title'] : ''; ?>" required>
                              </div>
                          </div>
                          <div class="row my-3">
                              <label for="content" class="col-sm-2 col-form-label">Content:</label>
                              <div class="col-sm-10">
                                  <!-- TinyMCE Editor -->
                                  <textarea id="content" name="content" class="tinymce-editor">
                                    <?php echo !empty($articleObject['content']) ? $articleObject['content'] : ''; ?>
                                  </textarea>
                                  <!-- End TinyMCE Editor -->
                              </div>
                          </div>
                          <div class="row my-3">
                              <label for="meta_keywords" class="col-sm-2 col-form-label">Meta Keywords:</label>
                              <div class="col-sm-10">
                                  <input type="text" id="meta_keywords" class="form-control" name="meta_keywords" value="<?php echo !empty($articleObject['meta_keyword']) ? $articleObject['meta_keyword'] : ''; ?>">
                              </div>
                          </div>
                          <div class="row my-3">
                              <label for="meta_description" class="col-sm-2 col-form-label">Meta Description:</label>
                              <div class="col-sm-10">
                                  <input type="text" id="meta_description" class="form-control" name="meta_description" value="<?php echo !empty($articleObject['meta_description']) ? $articleObject['meta_description'] : ''; ?>">
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
                <div class="col-lg-4">
                  <div class="card">
                      <div class="card-body pt-2">
                          <?php if (!empty($imageFullUrl)) : ?>
                              <div class="row my-3">
                                  <div class="col-sm-12">
                                      <img class="featured-image w-100" src="<?php echo $imageFullUrl; ?>" />
                                  </div>
                              </div>
                          <?php endif; ?>
                          <div class="row my-3">
                              <label for="image" class="col-sm-3 col-form-label">Image:</label>
                              <div class="col-sm-9">
                                  <input class="form-control" type="file" id="image" name="image" value="<?php echo $imageUrl; ?>">
                              </div>
                          </div>
                          <div class="row my-3">
                              <label for="category" class="col-sm-3 col-form-label">Category:</label>
                              <div class="col-sm-9">
                                  <ul class="list-group">
                                      <?php echo $dataObject->getCategoriesHtml($allCategories, $articleId); ?>
                                  </ul>
                              </div>
                          </div>
                          <div class="row my-3">
                              <div class="col-sm-12">
                                  <input type="submit" class="btn btn-primary w-100" value="Submit">
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
            </div>
        </form>
    </section>

  </main>
  <!-- End #main -->

  <!-- ======= Footer ======= -->
<?php require_once ('./includes/footer.php'); ?>
<?php require_once ('./includes/footer-scripts.php'); ?>

</body>

</html>
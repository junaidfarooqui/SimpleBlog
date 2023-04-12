<?php require_once ('../includes/config.php'); ?>
<?php
session_start();
if(!isset($_SESSION['user_id'])) {
    header('Location: ' . HOSTNAME .'/login.php');
    exit;
}
$dataObject = new DataAccessObject();
$allArticles = $dataObject->getAllRecords('articles');
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Blog Articles</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <?php require_once ('./includes/head.php'); ?>
</head>

<body>
<?php require_once ('./includes/header.php'); ?>
<?php require_once ('./includes/sidebar.php'); ?>
<main id="main" class="main">

    <div class="pagetitle my-5">
        <h1 class="d-inline-block">Blog Articles</h1>
        <a href="article.php" class="btn btn-primary float-lg-end">Add Article</a>
    </div>
    <!-- End Page Title -->

    <section class="section">
        <form method="post" action="" enctype="multipart/form-data">
            <input type="hidden" name="user_id" value="<?php echo $_SESSION['user_id']; ?>">
            <div class="row">
                <div class="card">
                    <div class="card-body">
                        <div class="col-lg-12">
                            <table class="table datatable">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Title</th>
                                    <th scope="col">slug</th>
                                    <th scope="col">Categories</th>
                                    <th scope="col">Author</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php $i = 1; foreach ($allArticles as $article):
                                    $dateTime = explode(' ', $article['date_created']);
                                    $authorInformation = $dataObject->getRecordById('users', $article['author_id']);
                                    $categoriesName = $dataObject->getCategoriesNameById($article['category_ids']);
                                    ?>
                                    <tr>
                                        <th scope="row"><?php echo $i; ?></th>
                                        <td><?php echo $article['title']; ?></td>
                                        <td><?php echo $article['slug']; ?></td>
                                        <td><?php echo $categoriesName; ?></td>
                                        <td><?php echo $authorInformation['username']; ?></td>
                                        <td><?php echo $dateTime[0]; ?></td>
                                        <td>
                                            <a class="icon-size-md d-inline-block me-2" href="article.php?id=<?php echo $article['id'];?>"><i class="bi bi-pencil-square"></i></a>
                                            <a class="icon-size-md d-inline-block" href="delete.php?id=<?php echo $article['id'];?>"><i class="ri-delete-bin-6-line"></i></a>
                                        </td>
                                    </tr>
                                <?php $i++; endforeach; ?>
                                </tbody>
                            </table>
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
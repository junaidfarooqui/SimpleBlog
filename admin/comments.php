<?php require_once ('../includes/config.php'); ?>
<?php
session_start();
if(!isset($_SESSION['user_id'])) {
    header('Location: ' . HOSTNAME .'/login.php');
    exit;
}
$dataObject = new DataAccessObject();
$allComments = $dataObject->getAllRecords('comments');
$commentId = isset($_GET['id']) ? $_GET['id'] : '';

if (!empty($commentId)) {
    $commentData = $dataObject->getRecordById('comments', $commentId);
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Blog Comments</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <?php require_once ('./includes/head.php'); ?>
</head>

<body>
<?php require_once ('./includes/header.php'); ?>
<?php require_once ('./includes/sidebar.php'); ?>
<main id="main" class="main">

    <div class="pagetitle my-5">
        <h1 class="d-inline-block">Comments</h1>
    </div>
    <!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="card">
                <div class="card-body pt-4">
                    <div class="col-lg-12">
                        <?php if (empty($commentId)): ?>
                            <table class="table datatable">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Headline</th>
                                    <th scope="col">Content</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Article</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php $i = 1; foreach ($allComments as $comment):
                                    $dateTime = explode(' ', $comment['date_created']);
                                    $articleData = $dataObject->getRecordById('articles', $comment['article_id']);
                                    ?>
                                    <tr>
                                        <th scope="row"><?php echo $i; ?></th>
                                        <td><?php echo $comment['headline']; ?></td>
                                        <td><?php echo $comment['content']; ?></td>
                                        <td><?php echo $comment['name']; ?></td>
                                        <td><?php echo $articleData['title']; ?></td>
                                        <td><?php echo ($comment['status'] === 'approved') ? 'Approved' : 'Pending' ?></td>
                                        <td><?php echo $dateTime[0]; ?></td>
                                        <td>
                                            <a class="icon-size-md d-inline-block me-2" href="?id=<?php echo $comment['id'];?>"><i class="bi bi-pencil-square"></i></a>
                                            <a class="icon-size-md d-inline-block" href="delete.php?id=<?php echo $comment['id'];?>"><i class="ri-delete-bin-6-line"></i></a>
                                        </td>
                                    </tr>
                                    <?php $i++; endforeach; ?>
                                </tbody>
                            </table>
                        <?php else: ?>
                            <form method="post" action="./includes/editComment.php" enctype="multipart/form-data" autocomplete="off">
                                <input type="hidden" name="comment_id" value="<?php echo !empty($commentData['id'])? $commentData['id'] : '' ?>">
                                <div class="row justify-content-center pt-3">
                                    <div class="col-12 col-lg-6 mb-3">
                                        <label class="form-label">Headline</label>
                                        <input type="text" value="<?php echo !empty($commentData['headline'])? $commentData['headline'] : '' ?>" name="headline" class="form-control" autocomplete="off" required>
                                    </div>
                                    <div class="col-12 col-lg-6 mb-3">
                                        <label class="form-label">Name</label>
                                        <input type="text" value="<?php echo !empty($commentData['name'])? $commentData['name'] : '' ?>" name="headline" class="form-control" autocomplete="off" required disabled>
                                    </div>
                                    <div class="col-12 col-lg-6 mb-3">
                                        <label class="form-label">Article</label>
                                        <?php $articleData = $dataObject->getRecordById('articles', $commentData['article_id']); ?>
                                        <input type="text" value="<?php echo !empty($articleData['title'])? $articleData['title'] : '' ?>" name="headline" class="form-control" autocomplete="off" required disabled>
                                    </div>
                                    <div class="col-12 col-lg-6 mb-3">
                                        <label class="form-label">Status</label>
                                        <select class="form-select" name="status" aria-label="Default select" required>
                                            <option value="">Select status</option>
                                            <option <?php echo ($commentData['status'] === 'approved') ? 'selected' : '' ?> value="approved">Approved</option>
                                            <option <?php echo ($commentData['status'] === 'pending') ? 'selected' : '' ?> value="pending">Pending</option>
                                        </select>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <label class="form-label">Content</label>
                                        <textarea class="form-control" name="content">
                                            <?php echo !empty($commentData['content'])? $commentData['content'] : '' ?>
                                        </textarea>
                                    </div>
                                    <div class="col-12 text-end">
                                        <button class="btn btn-primary" type="submit">Update</button>
                                    </div>
                                </div>
                            </form>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </section>

</main>
<!-- End #main -->

<!-- ======= Footer ======= -->
<?php require_once ('./includes/footer.php'); ?>
<?php require_once ('./includes/footer-scripts.php'); ?>

</body>

</html>
<?php require_once ('../includes/config.php'); ?>
<?php
session_start();
if(!isset($_SESSION['user_id'])) {
    header('Location: ' . HOSTNAME . '/login.php');
    exit;
}
$dataObject = new DataAccessObject();
$allCategories = $dataObject->getAllRecords('categories');

?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Create Blog Category</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

<?php require_once ('./includes/head.php'); ?>
</head>

<body>
<?php require_once ('./includes/header.php'); ?>
<?php require_once ('./includes/sidebar.php'); ?>
    <main id="main" class="main">

    <div class="pagetitle">
        <h1>Create Blog Category</h1>
    </div>
        <!-- End Page Title -->

    <section class="section">
        <form method="post" action="./includes/addCategory.php" enctype="multipart/form-data">
            <input type="hidden" name="user_id" value="<?php echo $_SESSION['user_id']; ?>">
            <div class="row">
                <div class="col-lg-4">
                  <div class="card">
                      <div class="card-body pt-2">
                          <div class="row my-3">
                              <label for="title" class="col-sm-2 col-form-label">Title:</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" id="title" name="title" required>
                              </div>
                          </div>
                          <div class="row my-3">
                              <label for="parent_id" class="col-sm-2 col-form-label">Parent:</label>
                              <div class="col-sm-10">
                                  <select class="form-select" id="categoriesList" name="parent_id">
                                      <option selected value="">Select parent</option>
                                      <?php foreach ($allCategories as $category):?>
                                          <option value="<?php echo $category['id']; ?>"><?php echo $category['name']; ?></option>
                                      <?php endforeach; ?>
                                  </select>
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
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-body pt-2">
                            <table class="table datatable">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">slug</th>
                                    <th scope="col">Date</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                $i = 1;
                                foreach ($allCategories as $category):
                                    $dateTime = explode(' ', $category['date_created'])
                                    ?>
                                    <tr>
                                        <th scope="row"><?php echo $i; ?></th>
                                        <td><?php echo $category['name']; ?></td>
                                        <td><?php echo $category['slug']; ?></td>
                                        <td><?php echo $dateTime[0]; ?></td>
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
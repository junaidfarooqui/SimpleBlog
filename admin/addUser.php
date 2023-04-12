<?php require_once ('../includes/config.php'); ?>
<?php
session_start();
if(!isset($_SESSION['user_id']) && !isset($_SESSION['user_role_id']) && $_SESSION['user_role_id'] !== 1) {
    header('Location: ' . HOSTNAME .'/login.php');
    exit;
}
$dataObject = new DataAccessObject();
$userId = !empty($_GET['id']) ? $_GET['id'] : '';
$allUsers = $dataObject->getAllRecords('users');
$userData = array();
if (!empty($userId)) {
    $userData = $dataObject->getRecordById('users', $userId);
}

$userRoleId = !empty($userData['role_id']) ? intval($userData['role_id']) : 0;
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Blog Users</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <?php require_once ('./includes/head.php'); ?>
</head>

<body>
<?php require_once ('./includes/header.php'); ?>
<?php require_once ('./includes/sidebar.php'); ?>
<main id="main" class="main">

    <div class="pagetitle my-5">
        <h1 class="d-inline-block">Add User</h1>
    </div>
    <!-- End Page Title -->

    <section class="section">
        <form method="post" action="../includes/submit-register.php" enctype="multipart/form-data" autocomplete="off">
            <input type="hidden" name="user_id" value="<?php echo !empty($userData['id'])? $userData['id'] : '' ?>">
            <div class="row">
                <div class="card">
                    <div class="card-body pt-3">
                        <div class="row justify-content-center">

                            <div class="col-12 col-lg-6 mb-3">
                                <label for="yourName" class="form-label">First Name</label>
                                <input type="text" value="<?php echo !empty($userData['first_name'])? $userData['first_name'] : '' ?>" name="first_name" class="form-control" id="yourName" autocomplete="off" required>
                                <div class="invalid-feedback">Please, enter your name!</div>
                            </div>

                            <div class="col-12 col-lg-6 mb-3">
                                <label for="yourName" class="form-label">Last Name</label>
                                <input type="text" value="<?php echo !empty($userData['first_name'])? $userData['last_name'] : '' ?>" name="last_name" class="form-control" id="yourName" autocomplete="off" required>
                                <div class="invalid-feedback">Please, enter your name!</div>
                            </div>

                            <div class="col-12 col-lg-6 mb-3">
                                <label for="yourEmail" class="form-label">Your Email</label>
                                <input type="email" value="<?php echo !empty($userData['first_name'])? $userData['email'] : '' ?>" name="email" class="form-control" id="yourEmail" autocomplete="off" required>
                                <div class="invalid-feedback">Please enter a valid Email adddress!</div>
                            </div>

                            <div class="col-12 col-lg-6 mb-3">
                                <label for="yourUsername" class="form-label">Username</label>
                                <div class="input-group has-validation">
                                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                                    <input type="text" value="<?php echo !empty($userData['first_name'])? $userData['username'] : '' ?>" name="username" class="form-control" id="yourUsername" autocomplete="off" required>
                                    <div class="invalid-feedback">Please choose a username.</div>
                                </div>
                            </div>

                            <div class="col-12 col-lg-6 mb-3">
                                <label for="userRole" class="form-label">User Role</label>
                                <select class="form-select" name="user_role" aria-label="Default select" required>
                                    <option value="">Select role</option>
                                    <option <?php echo ($userRoleId === 1) ? 'selected' : '' ?> value="1">Administrator</option>
                                    <option <?php echo ($userRoleId === 2) ? 'selected' : '' ?> value="2">Subscriber</option>
                                    <option <?php echo ($userRoleId === 3) ? 'selected' : '' ?> value="3">Editor</option>
                                </select>
                            </div>

                            <div class="col-12 col-lg-6 mb-3">
                                <label for="yourPassword" class="form-label">Password</label>
                                <input type="password" value="<?php echo !empty($userData['password'])? $userData['password'] : '' ?>" name="password" class="form-control" id="yourPassword" autocomplete="off" required>
                                <div class="invalid-feedback">Please enter your password!</div>
                            </div>

                            <div class="col-12 col-lg-3 mb-3">
                                <button class="btn btn-primary w-100" type="submit"><?php echo !empty($userId) ? 'Update Account' : 'Create Account' ?></button>
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
<?php
require_once ('./config.php');
// Start session
session_start();

$dataObject = new DataAccessObject();
$conn = $dataObject->connect();

// Check if form is submitted
if($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Get input values
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Validate input values (you can add more validation here)
    if(empty($username) || empty($password)) {
        echo "Please enter both username and password";
    } else {
        // Check connection
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }

        // Query the database to check if the user exists
        $sql = "SELECT * FROM users WHERE username='$username'";
        $result = mysqli_query($conn, $sql);

        // Check if there is a match
        $row = mysqli_fetch_array($result);

        var_dump($row);

        if ($row && password_verify($password, $row['password'])){
            $msg[] = "You have successfully logged in.";
            $_SESSION["user_id"] = $row['id'];
            $_SESSION['user_role_id'] = $row['role_id'];

            $roleId = intval($row['role_id']);

            if ($roleId === 1) {
                header('Location: ' . HOSTNAME . '/admin/');
                exit();
            } else {
                header('Location: ' . FRONTEND_HOST);
            }

        } else {
            echo "The password or email is incorrect.";
            sleep(5);
            header('Location: ' . HOSTNAME . '/login.php');
        }

        // Close database connection
        mysqli_close($conn);
    }
}

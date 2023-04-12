<?php
require_once ('./config.php');
$dataObject = new DataAccessObject();
$conn = $dataObject->connect();

const ADMINISTRATOR = 'administrator';
const SUBSCRIBER = 'subscriber';
const EDITOR = 'editor';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get the form data
    $userId = $_POST["user_id"];
    $firstName = $_POST["first_name"];
    $lastName = $_POST["last_name"];
    $email = $_POST["email"];
    $username = $_POST["username"];
    $password = password_hash($_POST["password"], PASSWORD_DEFAULT);
    $role = SUBSCRIBER;
    $roleId = 2;

    if(isset($_POST["user_role"]) && intval($_POST["user_role"]) == 1) {
        $role = ADMINISTRATOR;
    } else if (intval($_POST["user_role"]) == 2) {
        $role = SUBSCRIBER;
    } else if (intval($_POST["user_role"]) == 3) {
        $role = EDITOR;
    }

    if (isset($_POST["user_role"])) {
        $roleId = intval($_POST["user_role"]);
    }

    // Validate the form data
    if (empty($firstName) || empty($lastName) || empty($email) || empty($username) || empty($password)) {
        echo "Please fill out all fields.";
        exit;
    }

    if (!empty($userId)) {
        // Update the user in the database
        $sql = "UPDATE users SET username = '$username', first_name = '$firstName', last_name = '$lastName', email = '$email', password = '$password', role = '$role', role_id = '$roleId' WHERE id = '$userId'";
    } else {
        // Insert a new user account into the table
        $sql = "INSERT INTO users (username, first_name, last_name, email, password, role, role_id, date_created)
        VALUES ('$username', '$firstName', '$lastName', '$email', '$password', '$role', '$roleId', CURDATE())";
    }

    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    // Close the database connection
    $conn->close();

    // Redirect the user to a success page
    header('Location: ' . HOSTNAME . '/admin/users.php');
    exit;
}


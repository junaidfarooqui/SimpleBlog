<?php
include_once ('../../includes/config.php');

$dataObject = new DataAccessObject();
$conn = $dataObject->connect();

$commentId = $_POST['comment_id'];
$headline = $_POST['headline'];
$content = mysqli_real_escape_string($conn, $_POST['content']);
$status = $_POST['status'];

// Update the user in the database
$sql = "UPDATE comments SET headline = '$headline', content = '$content', status = '$status' WHERE id = '$commentId'";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Close the database connection
$conn->close();

// Redirect the user to a success page
header('Location: ' . HOSTNAME . '/admin/comments.php');
exit;
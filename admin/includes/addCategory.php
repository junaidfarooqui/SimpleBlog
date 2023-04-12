<?php
include_once ('../../includes/config.php');

$dataObject = new DataAccessObject();
$conn = $dataObject->connect();

// get the form data
$categoryName = $_POST['title'];
$categorySlug = $dataObject->sanitizeUrl($_POST['title']);
$parentCategory = !empty($_POST['parent_id']) ? $_POST['parent_id'] : '';

// validate the form data
if (empty($categoryName)) {
    die("Error: Category name is required.");
}

// insert the new category into the database
$query = "INSERT INTO categories (name, slug, parent_id) VALUES ('$categoryName', '$categorySlug', '$parentCategory')";

$result = $conn->query($query);

$conn->close();

// redirect the user to the category list page
header("Location: ../category.php");
exit();
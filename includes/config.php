<?php
// Please add project Dir name here
$projectDir = 'NewsBlog'; // if you intend to change project directory name please change here as well.

$root = (!empty($_SERVER['HTTPS']) ? 'https' : 'http') . '://' . $_SERVER['HTTP_HOST'] . '/' . $projectDir;
$folderRootPath = $_SERVER['DOCUMENT_ROOT'] . '/' . $projectDir;
$uploadDir = $root . '/admin/uploads/';
$frontendHost = 'http://localhost:3000/';

define('HOSTNAME', $root);
define('FILEPATH', $folderRootPath);
define('PROJECT_DIR', $projectDir);
define('UPLOAD_DIR', $uploadDir);
define('FRONTEND_HOST', $frontendHost);

// Loading Classes

// Include the DataAccessObject class
require_once(FILEPATH . '/admin/includes/classes/dataAccessObject.php');

// include all global functions
require_once(FILEPATH . '/admin/includes/functions.php');


// Error Visibility
//ini_set('display_errors', 1);
//ini_set('display_startup_errors', 1);
//error_reporting(E_ALL);
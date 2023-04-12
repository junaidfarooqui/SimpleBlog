<?php
require_once ('../includes/config.php');
require_once ('./class/Articles.php');

if(isset($_SERVER['HTTP_ORIGIN'])){
    header('Access-Control-Allow-Origin: ' . $_SERVER['HTTP_ORIGIN']);
}
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(204);
    exit;
}

session_start();

// Define the available endpoints and their corresponding handler functions
$endpoints = [
    '/' . PROJECT_DIR . '/api/articles' => 'handleArticles',
    '/' . PROJECT_DIR . '/api/comments' => 'handleComments',
    '/' . PROJECT_DIR . '/api/users' => 'handleUsers',
];

// Define the handler function for the '/articles' endpoint
function handleArticles($request)
{
    // Retrieve the query parameters
    $page = isset($_GET['page']) ? intval($_GET['page']) : 1;
    $perPage = isset($_GET['perPage']) ? intval($_GET['perPage']) : 5;

    $slug = isset($_GET['slug']) ? $_GET['slug'] : '';

    $articleApi =  new Articles();

    $data = $articleApi->getArticlesList($page , $perPage);

    if(!empty($slug)) {
        $data = $articleApi->getArticleDetails($slug);
    }

    header('Content-Type: application/json');

    echo json_encode($data);
}

function handleComments($request)
{
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $dataObject = new DataAccessObject();
        $articleId = isset($request['articleId']) ? intval($request['articleId']) : '';
        if (!empty($articleId)) {
            $result = $dataObject->commentListByArticleId($articleId);
        } else {
            $data = json_decode(file_get_contents('php://input'), true);
            $result = $dataObject->addComment($data);
        }

        header('Content-Type: application/json');
        echo json_encode($result);
    }
}

function handleUsers ($request)
{
    $userData = [
        'status' => 'error',
        'message' => 'No user Found!'
    ];

    if(isset($_SESSION['user_id'])) {
        $dataObject = new DataAccessObject();
        $userData = $dataObject->getRecordById('users', $_SESSION['user_id']);
        $userData['status'] = 'ok';
    }

    echo json_encode($userData);
}

// Parse the request URL and method
$request_url = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

$request_method = $_SERVER['REQUEST_METHOD'];

// Check if the request URL matches one of the defined endpoints and method
if (isset($endpoints[$request_url]) && $request_method == 'GET' || $request_method == 'POST') {
    // Call the handler function for the matched endpoint
    $handler = $endpoints[$request_url];
    $handler($_REQUEST);
} else {
    // Return a 404 error for invalid requests
    header('HTTP/1.0 404 Not Found');
    echo 'Error: Endpoint not found';
}

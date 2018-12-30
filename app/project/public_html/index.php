<?php

require_once(__DIR__ . '/../bootstrap.php');

if (ENVIRONMENT === 'dev')
{
    $app = new \Slim\App([
        'settings' => [
            'displayErrorDetails' => true
        ]
    ]);
}
else 
{
    $app = new Slim\App();
}

// Define app routes below

// Show the home page.
$app->get('/', function (Slim\Http\Request $request, \Slim\Http\Response $response, $args) {
    $homeController = new HomeController($request, $response, $args);
    return $homeController->index();
});

$app->run();
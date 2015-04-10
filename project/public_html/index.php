<?php

require_once(__DIR__ . '/../bootstrap.php');

$app = new \Slim\Slim();

$app->get('/', function ($name) {
    echo "Welcome to the programster's default template.";
});

$app->run();
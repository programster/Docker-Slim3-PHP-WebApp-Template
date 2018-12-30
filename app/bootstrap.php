<?php

/* 
 * This file is the 'preloader' that is responsible for setting everything up. 
 * Think of this as an initialization script.
 * This should be included for the web interface AND any scripts/processes that run separately, thus
 * it should only contain logic that any processes/services will need.
 */



require_once(__DIR__ . '/vendor/autoload.php'); # this autoloads all vendor packages
require_once(__DIR__ . '/settings.php');

$environment = getenv("ENVIRONMENT");

if ($environment === FALSE)
{
    die("Incorrect configuration: ENVIRONMENT not set. Please check your .env file.");
}

define("ENVIRONMENT", $environment);

if (in_array("ENVIRONMENT", ["dev", "development", "staging", "release"]))
{
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
}
else
{
    ini_set('display_errors', 0);
    ini_set('display_startup_errors', 0);
}


// Define which folders contain all of our php classes.
$classDirs = array(
    __DIR__ . '/controllers',
    __DIR__ . '/models',
    __DIR__ . '/views'
);

$autoloader = new iRAP\Autoloader\Autoloader($classDirs);


# put your custom init stuff here....

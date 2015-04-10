<?php

/* 
 * This file is the 'preloader' that is responsible for setting everything up. 
 * Think of this as an initialization script.
 * This should be included for the web interface AND any scripts/processes that run separately, thus
 * it should only contain logic that any processes/services will need.
 */

require_once(__DIR__ . '/vendor/autoload.php'); # this autoloads all vendor packages

require_once(__DIR__ . '/../settings/settings.php');

# put your stuff here....
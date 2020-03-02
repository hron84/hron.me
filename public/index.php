<?php

use Symfony\Component\Dotenv\Dotenv;

define('APP_DIR', realpath(__DIR__ . '/../'));



$container = require __DIR__ . '/../config/bootstrap.php';
$dispatcher = require APP_DIR . '/config/routes.php';

session_start();

$route = $dispatcher->dispatch($_SERVER['REQUEST_METHOD'], $_SERVER['REQUEST_URI']);

$params = $_GET + $_POST; // Order does matter!

switch ($route[0]) {
    case FastRoute\Dispatcher::NOT_FOUND:
        // TODO render 404 with smarty
        header('HTTP/1.0 404 Not Found');
        echo 'LOFASZ';
        break;
    case FastRoute\Dispatcher::METHOD_NOT_ALLOWED:
        // TODO Implement some fallback if not development?
        header('HTTP/1.0 405 Method Not Allowed');
        break;

    case FastRoute\Dispatcher::FOUND:
        $controller = $route[1];
        if(isset($route[2]) && is_array($route[2])) {
          $params += $route[2];
        }

        $container->call($controller, $params);
        break;
}

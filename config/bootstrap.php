<?php
use DI\ContainerBuilder;
use \Symfony\Component\Dotenv\Dotenv;

define('APP_NAME', 'FanDub');
define('APP_DIR', dirname(__DIR__));

define('LOG_DIR', APP_DIR . DIRECTORY_SEPARATOR . 'log');
define('TMP_DIR', APP_DIR . DIRECTORY_SEPARATOR . 'tmp');

require __DIR__ . '/../vendor/autoload.php';

ini_set('display_errors', true);
error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED);

$dotenv = new Dotenv();
$dotenv->load(APP_DIR . '/.env');

if(!function_exists('dump')) {
    function dump($mixed) {
        var_dump($mixed);
    }
}

if(!function_exists('dd')) {
    function dd($mixed) {
        var_dump($mixed);
        exit;
    }
}

@mkdir(LOG_DIR);
@mkdir(TMP_DIR);


$cb = new ContainerBuilder();
$cb->useAnnotations(true);
$cb->useAutowiring(true);
$cb->addDefinitions(APP_DIR . DIRECTORY_SEPARATOR . 'config/config.php');

if(file_exists(APP_DIR . DIRECTORY_SEPARATOR . 'config/config.' . $_ENV['APP_ENV'] . '.php')) {
    $cb->addDefinitions(APP_DIR . DIRECTORY_SEPARATOR . 'config/config.' . $_ENV['APP_ENV'] . '.php');
}

$cb->ignorePhpDocErrors($_ENV['APP_ENV'] == 'production');

if($_ENV['APP_ENV'] == 'production') {
    mkdir(TMP_DIR . DIRECTORY_SEPARATOR . 'di');
    $cb->enableCompilation(TMP_DIR . DIRECTORY_SEPARATOR . 'di');
}


/**
 * @var \Psr\Container\ContainerInterface
 */
$container = null;

try {
    $container = $cb->build();
} catch (Exception $e) {
}

return $container;

<?php

use \Psr\Container\ContainerInterface;
use \Psr\Container\NotFoundExceptionInterface;
use \Psr\Log\LogLevel;
use \Monolog\Logger;
use \Monolog\Handler\StreamHandler;

use function \DI\get;
use function \DI\factory;
use function \DI\autowire;

// function path_join(...$elements) {
//   return implode(DIRECTORY_SEPARATOR, $elements);
// }

function config_fallback($value, $fallback) {
    if (!isset($value) || is_null($value) || emopty($value) || (is_numeric($value) && $value === 0)) {
        return $fallback;
    } else {
        return $value;
    }
}

return array(

    /////////////////////////////////////////////////////////
    // Generic config                                      //
    //                                                     //
    // These variables could be overridden from env config //
    //                                                     //
    /////////////////////////////////////////////////////////

    'app.env' => $_ENV['APP_ENV'],

    'app.log.level' => $_ENV['APP_ENV'] == 'development' ? LogLevel::DEBUG : LogLevel::INFO,
    'app.log.file' => path_join(LOG_DIR, $_ENV['APP_ENV'] . '.log'),
    'app.log.max_files' => 5,

    'cache.max_lifetime' => 3600,

    /////////////////////////////////////////////////////////
    // Instantiating various stuffs                        //
    /////////////////////////////////////////////////////////

    \Monolog\Handler\StreamHandler::class => autowire('Monolog\Handler\RotatingFileHandler')
        ->constructorParameter('filename', get('app.log.file'))
        ->constructorParameter('maxFiles', get('app.log.max_files'))
        ->constructorParameter('level', get('app.log.level')),

    \Psr\Log\LoggerInterface::class => factory(function (ContainerInterface $c) {
        $logger = new Logger(APP_NAME);

        $handler = $c->get(StreamHandler::class);
        $formatter = new \Monolog\Formatter\LineFormatter();
        $formatter->ignoreEmptyContextAndExtra(true);
        $formatter->includeStacktraces(true);
        $handler->setFormatter($formatter);

        $logger->pushHandler($handler);

        return $logger;
    }),

    
    \Smarty::class => factory(function (ContainerInterface $c) {
        $smarty = new Smarty();

        $smarty->setCacheDir(path_join(TMP_DIR, 'smarty', 'cache'));
        $smarty->setCompileDir(path_join(TMP_DIR, 'smarty', 'templates_c'));
        $smarty->setTemplateDir(path_join(APP_DIR, 'src/views'));
        $smarty->addPluginsDir(path_join(APP_DIR, 'views', 'plugins'));

        if ($_ENV['APP_ENV'] == 'development') {
            $smarty->setDebugging(true);
            $smarty->setCaching(Smarty::CACHING_OFF);
        }

        if ($_ENV['APP_ENV'] == 'production') {
            $smarty->setDebugging(false);
            $smarty->setCaching(Smarty::CACHING_LIFETIME_SAVED);
            $smarty->setCacheLifetime($c->get('cache.max_lifetime'));
        }
        return $smarty;
    }),

    \PDO::class => function (ContainerInterface $c) {
      // TODO extract it to a driver-specific connection builder
      $db_url = parse_url($_ENV['DATABASE_URL']);
      // array (
      //   'scheme' => 'mysql',
      //   'host' => 'localhost',
      //   'port' => 3306,
      //   'user' => 'user',
      //   'pass' => 'pass',
      //   'path' => '/hron_portfolio',
      //   'query' => 'encoding=utf-8',
      // )

      $db_url['port'] = isset($db_url['port']) ? $db_url['port'] : ($db_url['scheme'] == 'mysql' ? 3306 : 5432);
      $db_url['path'] = substr($db_url['path'], 1); // Strip off leading slash

      $dsn = "{$db_url['scheme']}:host={$db_url['host']};port={$db_url['port']};dbname={$db_url['path']};";
      if($db_url['scheme'] == 'mysql') {
        $user = $db_url['user'];
        $pass = $db_url['pass'];
      } else {
        $dsn .= "user={$db_url['user']};password={$db_url['pass']};";
        $user = null;
        $Pass = null;
      }

      $params = parse_str($db_url['query']);
      $encoding = 'utf8';
      if(isset($params['encoding'])) {
        $encoding = $params['encoding'];
        unset($params['encoding']);
      }

      if($db_url['scheme'] == 'pgsql') {
        foreach($params as $param => $value) {
          $dsn .= "{$param}={$value};";
        }
      }
      $c->get('logger')->debug("PDO DSN: {$dsn}, user: {$user}");

      $pdo = new \PDO($dsn, $user, $pass);

      return $pdo;
    },

    /////////////////////////////////////////////////////////
    // Aliases for comfort                                 //
    /////////////////////////////////////////////////////////
    'logger' => get('Psr\Log\LoggerInterface'),
);

<?php

namespace Portfolio\Controller;


use Psr\Log\LoggerInterface;
use \Psr\Container\ContainerInterface;

abstract class BaseController {
  /**
   * @var \Smarty
   */
  protected $smarty;

  /**
   * @var LoggerInterface logger
   */
  protected $logger;

  /**
   * @var ContainerInterface container
   */
  protected $container;

  /**
   * HomeController constructor.
   * @param \Smarty $smarty Smarty engine
   * @param LoggerInterface $logger Log writer
   * @param ContainerInterface $container DI container
   */
  function __construct(\Smarty $smarty, LoggerInterface $logger, ContainerInterface $container) {
    $this->smarty = $smarty;
    $this->logger = $logger;
    $this->container = $container;
  }

  /**
   * Renders the specified template with the binding
   *
   * Example usage:
   * 
   * ```
   * $this->render('template.tpl', 
   *   $params['id'],
   *   function() { 
   *     $post = $this->postRepository->find($params['id']);
   *     $author = $this->userRepository->find($post->author_id);
   *     return ['post' => $post, 'author' => $author, 'currentUser' => $this->auth->currentUser]
   *   });
   * ```
   *
   * @param string $view Template name
   * @param string|null $cache_id Cache ID
   * @param array|null $variables Callback or array of variables
   */
  function render($view, $cache_id = null, $binding = null) {

    if(!$this->smarty->isCached($view, $cache_id)) {
      $variables = [];

      // Process the binding
      if(!is_null($binding) && is_callable($binding)) {
        // The callback is something that seems like a callable. The container
        // provides extra functionality (like, autowiring services), so we pass the
        // whole callable over it
        $variables = $this->container->call($binding);
      } else if(is_array($binding)) {
        // Trying differentiate a DI call from a real array
        if(is_array($binding[0]) && is_array($binding[1]) && class_exists($binding[0][0])) {
          // It quacks like a DI instruction for an injected service call...
          $variables = $this->container->call($binding[0], $binding[0]);
        } else {
          // It's a simple, plain old array, let's pass to Smarty, do whatever it can with this mess.
          $variables = $binding;
        }
      }

      $this->smarty->assign($variables);
    } // END isCached()

    $this->smarty->display($view, $cache_id);
  }

  function renderJSON($data, $status = 200) {
    http_response_code($status);

    $options = 0;
    if($this->container->get('app.env') === 'development') {
      $options &= JSON_PRETTY_PRINT;
    }

    echo json_encode($data, $options);
  }

  function redirectTo($redirect, $permanent = false) {
    if($redirect == 'back') {
      if(isset($_SERVER['HTTP_REFERER'])) {
        $redirect = $_SERVER['HTTP_REFERER'];
      } else {
        $redirect = '/';
      }
      http_response_code($permanent ? 301 : 302);
      header("Location: {$redirect}");
    }
  }

  function flash($status, $message) {
    // We overwrite all previous message in the flash. Only one message allowed
    $_SESSION['flash'] = ['status' => $status, 'message' => $message];
  }

}


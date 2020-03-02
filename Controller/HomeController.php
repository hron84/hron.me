<?php

namespace Portfolio\Controller;

use Psr\Log\LoggerInterface;

//class HomeController {
class HomeController extends BaseController {
    public function index() {
      //$this->smarty->display('index.tpl');
      $this->render('index.tpl');
    }
}

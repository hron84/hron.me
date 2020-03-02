<?php

use FastRoute\RouteCollector;

return \FastRoute\simpleDispatcher(function (RouteCollector $r) {
    $r->addRoute('GET', '/', ['Portfolio\Controller\HomeController', 'index']);
    $r->addRoute('POST', '/contact', ['Portfolio\Controller\ContactController', 'sendEmail']);
});
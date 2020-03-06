<?php

namespace Portfolio\Controller;

use Psr\Log\LoggerInterface;
use Portfolio\Repository\ProjectRepository;
use Portfolio\Repository\CompanyRepository;

//class HomeController {
class HomeController extends BaseController {

  /**
   *  @var ProjectRepository
   */
  private $projectRepository;

  /** 
   * @var CompanyRepository 
   */ 
  private $companyRepository;

  protected function initController() {
    // print "LOFASZ";
    $this->companyRepository = $this->container->get(CompanyRepository::class);
    $this->projectRepository = $this->container->get(ProjectRepository::class);
  }

  public function index() {
    //$this->smarty->display('index.tpl');
    // $this->render('index.tpl');
    $this->render('index.tpl', null, function() {
      $companies = $this->companyRepository->findAll();
      $projects = $this->projectRepository->findAll();
      //print_r($projects);
      return ['projects' => $projects, 'companies' => $companies];
    });
  }
}

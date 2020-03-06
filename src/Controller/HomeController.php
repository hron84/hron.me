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



  public function __construct(
    ProjectRepository $projectRepository, 
    CompanyRepository $companyRepository) {
    $this->projectRepository = $projectRepository;
    $this->companyRepository = $companyRepository;
  }

    public function index() {
      print_r($this); return;
      //$this->smarty->display('index.tpl');
      $this->render('index.tpl');
      /*
      $this->render('index.tpl', null, function() {
        $companies = $this->companyRepository->findAll();
        $projects = $this->projectRepository->findAll();

        return ['projects' => $projects, 'companies' => $companies];
      });*/
    }
}

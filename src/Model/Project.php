<?php

namespace Portfolio\Model;

class Project extends BaseModel {
  protected $attributes = ['id', 'title', 'description', 'repo_url', 'website', 'image_path'];

  public function siteHost() {
    $tmp = parse_url($this['website']);
    $host = str_replace('www.', '', $tmp['host']);
    return ucfirst($host);
  }

  public function repoText() {
    if(strstr($this['repo_url'], 'github.com')) {
      return 'GitHub';
    }
    if(strstr($this['repo_url'], 'bitbucket.org')) {
      return 'Bitbucket';
    } else { return 'Lofasz'; }
  }

  public function repoIcon() {
    if(strstr($this['repo_url'], 'github')) {
      return 'fa-github';
    }
    
    if(strstr($this['repo_url'], 'bitbucket')) {
      return 'fa-bitbucket';
    } else { 
      return 'fa-file'; 
    }

  }
}

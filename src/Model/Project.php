<?php

namespace Portfolio\Model;

class Project extends BaseModel {
  protected $attributes = ['id', 'title', 'description', 'repo_url', 'website'];
}

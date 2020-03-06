<?php

namespace Portfolio\Model;

class Company extends BaseModel {
  protected $attributes = ['id', 'name', 'short_desc', 'long_desc', 'url', 'image_path'];
}

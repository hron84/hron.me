<?php

namespace Portfolio\Model;

class Company extends BaseModel {
  protected $attributes = ['id', 'name', 'year_begin', 'year_end', 'short_desc', 'long_desc', 'url', 'image_path'];

  public function range() {
    if($this['year_begin'] == $this['year_end']) {
      return $this['year_begin'];
    } else {
      return sprintf("%d-%d", $this['year_begin'], $this['year_end']);
    }
  }

  public function longDescription() {
    return nl2br($this['long_desc']);
  }

  public function buttonText() {
    $tmp = explode(' ', $this['name']);
    return sprintf('%s weboldal', $tmp[0]); 
  }
}

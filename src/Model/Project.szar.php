<?php

class Project implements ArrayAccess {
  private $_internal = [];

  private $attributes = ['id', 'title', 'description', 'repo_url', 'website'];

  public function __construct($props) {
    // Filter assigned attributes
    foreach($props as $attr => $value) {
      if($this->attrAllowed($attr)) {
        $this->_internal[$attr] = $value;
      }
    }
  }

  public function offsetSet($attr, $value) {
    if($this->attrAllowed($attr)) {
      $this->_internal[$attr] = $value;
    }
  }

  public function offsetGet($attr) {
    if($this->offsetExists($attr)) {
      return $this->_internal[$attr];
    }
  }

  public function offsetExists($attr) {
    return isset($this->_internal[$attr]);
  }

  protected function attrAllowed($attr) {
    return !is_null($attr) && !empty($attr) && in_array($attr, $this->attributes);
  }
}

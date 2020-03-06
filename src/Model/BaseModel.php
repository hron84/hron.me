<?php

namespace Portfolio\Model;

abstract class BaseModel implements \ArrayAccess {
  private $_internal = [];

  protected $attributes = [];

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

  public function offsetUnset($attr) {
    if($this->attrAllowed($attr) && $this->offsetExists($attr)) {
      unset($this->_internal[$attr]);
    }
  }

  public function offsetExists($attr) {
    return isset($this->_internal[$attr]);
  }

  protected function attrAllowed($attr) {
    return !is_null($attr) && !empty($attr) && in_array($attr, $this->attributes);
  }
}

<?php

function yesno($foo) {
  return $foo ? 'Yes' : 'No';
}

var_export(parse_url('mysql://user:pass@localhost:3306/hron_portfolio?encoding=utf-8'));
exit;

$arr = [];
//$x = $arr[1];
$x = $arr;

print "value: " . PHP_EOL;
var_export($x);
print PHP_EOL . PHP_EOL;

print 'Is set: ' . yesno(isset($x)) . PHP_EOL;
print 'Is null: ' . yesno(is_null($x)) . PHP_EOL;
print 'Is empty: ' . yesno(empty($x)) . PHP_EOL;
print 'Is array: ' . yesno(is_array($x)) . PHP_EOL;
print 'Is numeric: ' . yesno(is_numeric($x)) . PHP_EOL;

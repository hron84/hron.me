<?php
/* Smarty version 3.1.34-dev-7, created on 2020-02-22 23:00:38
  from '/srv/www/www.hron.me/htdocs/views/index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.34-dev-7',
  'unifunc' => 'content_5e51a486e16f85_28645672',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'd3af27a83b94013cf90f5f3e7bcad432bb8d29bb' => 
    array (
      0 => '/srv/www/www.hron.me/htdocs/views/index.tpl',
      1 => 1581538931,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:sections/jumbotron.tpl' => 1,
    'file:sections/projects.tpl' => 1,
    'file:sections/companies.tpl' => 1,
    'file:sections/contact_icons.tpl' => 1,
  ),
),false)) {
function content_5e51a486e16f85_28645672 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_17297154875e51a486e0ab24_79396920', "content");
$_smarty_tpl->inheritance->endChild($_smarty_tpl, "layout.tpl");
}
/* {block "content"} */
class Block_17297154875e51a486e0ab24_79396920 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'content' => 
  array (
    0 => 'Block_17297154875e51a486e0ab24_79396920',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

    <?php $_smarty_tpl->_subTemplateRender("file:sections/jumbotron.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
    <?php $_smarty_tpl->_subTemplateRender("file:sections/projects.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
    <?php $_smarty_tpl->_subTemplateRender("file:sections/companies.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
    <?php $_smarty_tpl->_subTemplateRender("file:sections/contact_icons.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
/* {/block "content"} */
}

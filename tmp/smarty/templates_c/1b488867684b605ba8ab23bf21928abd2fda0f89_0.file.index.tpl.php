<?php
/* Smarty version 3.1.34-dev-7, created on 2020-02-19 18:33:43
  from '/srv/www/dev.hron.me/htdocs/views/index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.34-dev-7',
  'unifunc' => 'content_5e4d71775dbfe1_61992461',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '1b488867684b605ba8ab23bf21928abd2fda0f89' => 
    array (
      0 => '/srv/www/dev.hron.me/htdocs/views/index.tpl',
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
function content_5e4d71775dbfe1_61992461 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_8409926465e4d71775cfc72_99406116', "content");
$_smarty_tpl->inheritance->endChild($_smarty_tpl, "layout.tpl");
}
/* {block "content"} */
class Block_8409926465e4d71775cfc72_99406116 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'content' => 
  array (
    0 => 'Block_8409926465e4d71775cfc72_99406116',
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

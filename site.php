<?php

use \Thiago\Page;
use \Thiago\Model\Ramal;
use \Thiago\DB\Sql;


$app->get('/', function() {

	$ramal = Ramal::listAll();
	
	$page = new Page();

	$page->setTpl("index", array(
		"ramal"=>$ramal
	));


});

$app->get('/post', function() {
    
	$page = new Page();

	$page->setTpl("post");

});

$app->get('/blog', function() {
    
	$page = new Page();

	$page->setTpl("blog");

});

?>
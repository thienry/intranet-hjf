<?php 

require_once("vendor/autoload.php");

use \Slim\Slim;
use \Thiago\Page;
use \Thiago\PageAdmin;
use \Thiago\Ramal;
use \Thiago\DB\Sql;

$app = new Slim();

$app->config('debug', true);

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

$app->get('/admin', function() {

	
	
	$page = new PageAdmin();

	$page->setTpl("index", array(
		
	));


});

$app->run();

?>
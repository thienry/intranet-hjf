<?php 

require_once("vendor/autoload.php");

use \Slim\Slim;
use \Thiago\Page;

$app = new Slim();

$app->config('debug', true);

$app->get('/', function() {
    
	$page = new Page();

	$page->setTpl("index");

});

$app->get('/post', function() {
    
	$page = new Page();

	$page->setTpl("post");

});

$app->get('/blog', function() {
    
	$page = new Page();

	$page->setTpl("blog");

});

$app->run();

?>
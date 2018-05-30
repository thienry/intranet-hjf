<?php

use \Thiago\PageAdmin;
use \Thiago\Model\User;


$app->get('/admin', function() {

	User::verifyLogin();

	$user = new User();

	$user = User::getFromSession();

	$page = new PageAdmin();

	$page->setTpl("index", array(
		"user"=>$user->getValues()
	));

});

$app->get('/admin/login', function() {

	$page = new PageAdmin([
		"header"=>false,
		"footer"=>false
	]);

	$erro = isset($_GET['erro']) ? $_GET['erro'] : 0;

	$page->setTpl("login", [
		"erro"=>$erro
	]);
});

$app->post('/admin/login', function() {

	User::login($_POST["login"], $_POST["senha"]);

	header("Location: /admin");
	exit;

});

$app->get('/admin/logout', function() {

	User::logout();

	header("Location: /admin/login");
	exit;

});

?>
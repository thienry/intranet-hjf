<?php

use \Thiago\PageAdmin;
use \Thiago\Model\User;
use \Thiago\Model\Post;

$app->get('/admin', function() {

	User::verifyLogin();

	User::expiraLogin();

	$user = new User();

	$user = User::getFromSession();

	$post = Post::listAllLimit();

	$posts = new Post();

	$page = new PageAdmin();

	$page->setTpl("index", array(
		"user"=>$user->getValues(),
		"posts"=>$posts->getValues(),
		"posts"=>Post::checkList($post)
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
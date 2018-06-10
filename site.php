<?php

use \Thiago\Page;
use \Thiago\Model\Ramal;
use \Thiago\DB\Sql;
use \Thiago\Model\Post;


$app->get('/', function() {

	$ramal = Ramal::listAll();

	$posts = Post::listAllLimit2();
	
	$page = new Page();

	$page->setTpl("index", array(
		"ramal"=>$ramal,
		"posts"=>Post::checkList($posts)
	));


});

$app->get('/blog/:idpost/:titulo', function($idpost, $titulo) {

	$post = new Post();

	$post->getFromURL($idpost, $titulo);

	$posts = Post::listAllLimit2();

	$page = new Page();

	$page->setTpl("post", [
		"post"=>$post->getValues(),
		"posts"=>Post::checkList($posts)		
	]);

});

$app->get('/blog', function() {
	
	$page = (isset($_GET['page'])) ? (int)$_GET['page'] : 1;
	
	$post = Post::listAll();

	$posts = new Post();

	$pagination = $posts->getPostsPage($page);

	$pages = [];

	for ($i=1; $i<=$pagination['pages']; $i++) {

		array_push($pages, [
			'link'=>'/blog'.'?page='.$i,
			'page'=>$i
		]);

	}

	$page = new Page();

	$page->setTpl("blog", array(
		"posts"=>Post::checkList($post),
		"posts"=>$pagination['data'],
		"pages"=>$pages
	));

});

?>
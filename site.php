<?php

use \Thiago\Page;
use \Thiago\Model\Ramal;
use \Thiago\DB\Sql;
use \Thiago\Model\Post;
use \Thiago\Model\Notificacao;


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

	$page = new Page([
		"header"=>false,
		"footer"=>false
	]);

	$post = new Post();

	$post->getFromURL($idpost, $titulo);

	$posts = Post::listAllLimit2();

	$page->setTpl("post", [
		"post"=>$post->getValues(),
		"posts"=>Post::checkList($posts)		
	]);

});

$app->get('/blog', function() {

	$page = new Page([
		"header"=>false,
		"footer"=>false
	]);
	
	$pagina = (isset($_GET['page'])) ? (int)$_GET['page'] : 1;
	
	$post = Post::listAll();

	$posts = new Post();

	$pagination = $posts->getPostsPage($pagina);

	$pages = [ 
		
		'antes' => [
			
			'link'=>'/blog'.'?page='.($pagina - 1)
	
		],
	
		'depois' => [
	
			'link'=>'/blog'.'?page='.($pagina + 1) 
	
		] 
		
	];

	if($pagina > $pagination['pages'] || $pagina < 1 ) {

		header('Location: /blog');
		exit;

	}

	
	$page->setTpl("blog", array(
		"posts"=>Post::checkList($post),
		"posts"=>$pagination['data'],
		"paginas"=>$pagination['pages'],
		"pages"=>$pages,
		"pagina"=>$pagina
	));
	
});

$app->get('/notificacao', function() {

	$success = isset($_GET['success']) ? $_GET['success'] : 0;

	$page = new Page();
	
	$page->setTpl("notificacao", array(
		"success"=>$success
	));
});

$app->post('/notificacao', function() {

	$notificacao = new Notificacao();

	$notificacao->setData($_POST);

	$notificacao->save();
	
	$notificacao->sendNotification();
	
	header("Location: /notificacao?success=1");
    exit;

});

?>
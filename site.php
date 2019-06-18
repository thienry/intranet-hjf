<?php

use \Thiago\Page;
use \Thiago\Model\Ramal;
use \Thiago\DB\Sql;
use \Thiago\Model\Post;
use \Thiago\Model\Popup;
use \Thiago\Model\Notificacao;
use Thiago\Model\Convenant;
use \Thiago\PageEvents;
use \Thiago\PageEvent;

$app->get('/', function() {
	$ramal = Ramal::listAll();
	$posts = Post::listAllLimit2();
	$popups = Popup::getLast2Popups();
	$page = new Page();
	$page->setTpl("index", array(
		"ramal" => $ramal,
		"posts" => Post::checkList($posts),
		"popups" => Popup::checkList($popups),
		"displayBannerControl" => 1,
		"displayPopupControl" => 1,
		"classActiveControl" => 2,
	));
});

$app->get('/blog/:idpost/:titulo', function($idpost, $titulo) {
	$page = new Page([
		"header"=>false,
		"footer"=>false
	]);
	$post = new Post();
	$post->getFromURL($idpost, $titulo);
	$posts = Post::getLast3Posts();
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

$app->get("/docs", function() {
	$page = new Page([
		"header"=>false,
		"footer"=>false
	]);
	$page->setTpl("docs");
});

$app->get("/convenants-list", function () {
	$convenant = Convenant::listAll();

	$page = new Page([
		"header" => false,
		"footer" => false
	]);
	$page->setTpl("convenants-list", [
		"convenant" => $convenant
	]);
});

$app -> get("/events", function() {
	$page = new PageEvents([
		"header" => false,
		"footer" => false
	]);
	$page->setTpl("events");
});

$app->get('/event/treinamento-protocolo-de-dor-toracica', function () {
	$page = new PageEvent([
		"header" => false,
		"footer" => false
	]);
	$page->setTpl("event-1");
});

$app->get("/event/dia-das-maes", function () {
	$page = new PageEvent([
		"header" => false,
		"footer" => false
	]);
	$page->setTpl("event-2");
});

$app->get("/event/semana-enfermagem", function () {
	$page = new PageEvent([
		"header" => false,
		"footer" => false
	]);
	$page->setTpl("event-3");
});

$app->get("/event/semana-enfermagem", function () {
	$page = new PageEvent([
		"header" => false,
		"footer" => false
	]);
	$page->setTpl("event-3");
});

$app->get("/event/bencao-comemoracao-transplantes", function () {
	$page = new PageEvent([
		"header" => false,
		"footer" => false
	]);
	$page->setTpl("event-4");
});

$app->get("/event/homenagem-liga-academica-transplante-figado", function () {
	$page = new PageEvent([
		"header" => false,
		"footer" => false
	]);
	$page->setTpl("event-5");
});

?>

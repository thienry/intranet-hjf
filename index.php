<?php 

session_start();

require_once("vendor/autoload.php");

use \Slim\Slim;
use \Thiago\Page;
use \Thiago\PageEvent;
use \Thiago\PageEvents;
use \Thiago\PageAdmin;
use \Thiago\Ramal;
use \Thiago\DB\Sql;
use \Thiago\Model\User;

$app = new Slim();

$app->config('debug', true);

$app->notFound(function () use ($app) {
    $page = new Page([
		"header"=>false,
		"footer"=>false
	]);
    $page->setTpl('erro-404');
});

require_once("admin.php");
require_once("admin-convenants.php");
require_once("admin-notifications.php");
require_once("admin-events.php");
require_once("admin-popups.php");
require_once("admin-posts.php");
require_once("admin-ramais.php");
require_once("admin-users.php");
require_once("functions.php");
require_once("site.php");

$app->run();

?>
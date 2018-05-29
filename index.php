<?php 

session_start();

require_once("vendor/autoload.php");

use \Slim\Slim;
use \Thiago\Page;
use \Thiago\PageAdmin;
use \Thiago\Ramal;
use \Thiago\DB\Sql;
use \Thiago\Model\User;

$app = new Slim();

$app->config('debug', true);

require_once("site.php");
require_once("admin.php");
require_once("admin-users.php");
require_once("admin-ramais.php");
require_once("admin-posts.php");

$app->run();

?>
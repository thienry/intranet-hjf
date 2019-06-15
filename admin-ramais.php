<?php

use \Thiago\PageAdmin;
use \Thiago\Model\Ramal;
use \Thiago\Model\User;

$app->get("/admin/ramais", function() {
	User::verifyLogin();
	$user = new User();
	$user = User::getFromSession();
    $ramais = Ramal::listAll();
    $page = new PageAdmin();
	$page->setTpl("ramais", array(
		"ramais"=>$ramais,
		"user"=>$user->getValues()
	));
});

$app->get('/admin/ramais/create', function() {
	User::verifyLogin();
	$user = new User();
	$user = User::getFromSession();
	$page = new PageAdmin();
	$page->setTpl("ramais-create", [
		"user"=>$user->getValues()
	]);
});

$app->post("/admin/ramais/create", function() {
	User::verifyLogin();
	$ramal = new Ramal();
	$ramal->setData($_POST);
	$ramal->save();
	header("Location: /admin/ramais");
	exit;
});

$app->get("/admin/ramais/:id_agenda/delete", function($idramal) {
	User::verifyLogin();
	$ramal = new Ramal();
	$ramal->get((int)$idramal);
  $ramal->delete();
  header("Location: /admin/ramais");
	exit;
});

$app->get('/admin/ramais/:id_agenda', function($idagenda) {
	User::verifyLogin();
	$user = new User();
	$user = User::getFromSession();
	$ramal = new Ramal();
	$ramal->get((int)$idagenda);
	$page = new PageAdmin();
	$page->setTpl("ramais-update", array(
		"ramal"=>$ramal->getValues(),
		"user"=>$user->getValues()
	));
});

$app->post("/admin/ramais/:id_agenda", function($idagenda) {
	User::verifyLogin();
	$ramal = new Ramal();
	$ramal->get((int)$idagenda);
    $ramal->setData($_POST);
	$ramal->update();
	header("Location: /admin/ramais");
	exit;
});

?>
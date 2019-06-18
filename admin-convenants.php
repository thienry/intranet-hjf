<?php

use \Thiago\PageAdmin;
use \Thiago\Model\Convenant;
use \Thiago\Model\User;

$app -> get("/admin/convenants", function() {
  $user = new User();
  $user = User::verifyLogin();
  $user = User::getFromSession();
  
  $convenants = Convenant::listAll();
  
  $page = new PageAdmin;
  $page -> setTpl("convenants", [
    "convenants" => $convenants,
    "user" => $user -> getValues()
  ]);
});

$app->get("/admin/convenants/create", function () { 
  $user = new User();
  $user = User::verifyLogin();
  $user = User::getFromSession();
  
  $page = new PageAdmin();
  $page -> setTpl("convenants-create", [
    "user" => $user -> getValues()
  ]);
});

$app->post("/admin/convenants/create", function () { 
  User::verifyLogin();
  
  $convenant = new Convenant();
  $_POST["id_user"] = (isset($_POST["id_user"])) ? 1 : 0;
  $convenant -> setData($_POST);
  $convenant -> save();

  header("Location: /admin/convenants");
  exit;
});

$app->get("/admin/convenants/:id_convenant/delete", function ($id_convenant) {
  User::verifyLogin();
  
  $convenant = new Convenant();
  $convenant -> get((int)$id_convenant);
  $convenant -> delete();

  header("Location: /admin/convenants");
  exit;
});

$app->get("/admin/convenants/:id_convenant", function ($id_convenant) {
  $user = new User();
  $user = User::verifyLogin();
  $user = User::getFromSession();

  $convenant = new Convenant();
  $convenant -> get((int)$id_convenant);

  $page = new PageAdmin();
  $page -> setTpl("convenants-update", [
    "convenant" => $convenant -> getValues(),
    "user" => $user -> getValues()
  ]);
});

$app->post("/admin/convenants/:id_convenant", function ($id_convenant) {
  User::verifyLogin();

  $convenant = new Convenant();
  $convenant -> get((int)$id_convenant);
  $_POST["id_user"] = (isset($_POST["id_user"])) ? 1 : 0;
  $convenant -> setData($_POST);
  $convenant -> update();

  header("Location: /admin/convenants");
  exit;
});

?>
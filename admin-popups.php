<?php

use \Thiago\PageAdmin;
use \Thiago\DB\Sql;
use \Thiago\Model\Popup;
use \Thiago\Model\User;

/**
 * Get Route List all popups stored
 */
$app -> get("/popups", function() {
  User::verifyLogin();
  $user = new User();
  $user = User::getFromSession();
  $popups = Popup::getPopups();
  $page = new PageAdmin();
  $page -> setTpl("popups", [
    "popups" => $popups,
    "user" => $user -> getValues()
  ]);
});

/**
 * Get Route form to create a new popup
 */
$app -> get("/admin/popups/create", function() {
  User::verifyLogin();
  $user = new user();
  $user = User::getFromSession();
  $popup = new Popup();
  $page = new PageAdmin();
  $page -> setTpl("popups-create", [
    "user" => $user -> getValues(),
    "popup" => $popup -> getImageCreate()
  ]); 
});

/**
 * Post Route form to create a new popup
 */
$app->post("/admin/popups/create", function () {
  User::getFromSession();
  $popup = new Popup();
  $popup -> setData($_POST);
  $popup -> save();
  if ((int)$_FILES["file"]["size"] > 0) {
    $popup -> setPhoto($_FILES["file"]);
  }
  header("Location: /admin/popups");
  exit;
});

/**
 * Get Route to delete a popup 
 */
$app->get("/popups/:id_popup/delete", function ($id_popup) {
  User::getFromSession();
  $popup = new Popup();
  $popup -> get((int)$id_popup);
  $popup -> delete();
  header("Location: /admin/popups");
  exit;
});

?>
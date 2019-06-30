<?php

use \Thiago\PageAdmin;
use \Thiago\Model\Event;
use \Thiago\Model\User;

$app -> get("/admin/events", function() {
  User::verifyLogin();  
  $user = User::getFromSession();

  $events = Event::listAll();
  
  $page = new PageAdmin();
  $page -> setTpl("events", [
    "events" => $events,
    "user" => $user -> getValues()
  ]);
});

$app -> get("/admin/events/create", function() {
  User::verifyLogin();
  $user = new User();
  $user = User::getFromSession();

  $event = new Event();

  $page = new PageAdmin();
  $page -> setTpl("events-create", [
    "user" => $user -> getValues(),
    "event" => $event -> getImageCreate()
  ]);
});

$app -> post("/admin/events/create", function() {
  User::verifyLogin();

  $event = new Event();
  $event -> setData($_POST);
  $event -> save();

  if ((int)$_FILES["files"]["size"] > 0) {
    $event -> setPhotos($_FILES["files"], 1);
  }

  header("Location: /admin/events");
  exit;
});

$app -> get("/admin/events/:id_event/delete", function($id_event) {
  User::verifyLogin();

  $event = new Event();
  $event -> get((int)$id_event);
  $event -> delete();

  header("Location: /admin/events");
  exit;
});

$app -> get("/admin/events/:id_event", function($id_event) {
  User::verifyLogin();
  $user = new User();
  $user = User::getFromSession();

  $event = new Event();
  $event -> get((int)$id_event);
  $event -> getPhotos();
  
  $page = new PageAdmin();
  $page -> setTpl("events-update", [
    "user"=>$user->getValues(),
    "event" => $event -> getValues(),
    "events" => $event -> getPhotos()
  ]);
});

$app -> post("/admin/events/:id_event", function($id_event) {
  User::verifyLogin();

  $event = new Event();
  $event -> get((int)$id_event);
  $event -> setData($_POST);
  $event -> save();
  $event -> setPhotos($_FILES["files"], $id_event);

  header("Location: /admin/events");
  exit;
});
<?php

use \Thiago\PageAdmin;
use \Thiago\Model\Post;
use \Thiago\Model\User;

$app->get("/admin/posts", function() {
    User::verifyLogin();
    $user = new User();
	$user = User::getFromSession();
    $posts = Post::listAll();
    $page = new PageAdmin();
    $page->setTpl("posts", [
        "posts"=>$posts,
        "user"=>$user->getValues()
    ]);
});

$app->get('/admin/posts/create', function() {
    User::verifyLogin();
    $user = new User();
    $user = User::getFromSession();
    $post = new Post();
    $page = new PageAdmin();
	$page->setTpl("posts-create", [
        "user"=>$user->getValues(),
        "post"=>$post->getImageCreate()
    ]);
});

$app->post('/admin/posts/create', function() {
    User::verifyLogin();
    $post = new Post();
    $_POST["post_active"] = (isset($_POST["post_active"])) ? 1 : 0;
    $post->setData($_POST);
    $post->save();
    if ((int)$_FILES["file"]["size"] > 0) {
        $post->setPhoto($_FILES["file"]);
    }
    header("Location: /admin/posts");
    exit;
});

$app->get('/admin/posts/:idpost/delete', function($idpost) {
    User::verifyLogin();
    $post = new Post();
    $post->get((int)$idpost);
    $post->delete();
    header("Location: /admin/posts");
    exit;
});

$app->get('/admin/posts/:idpost', function($idpost) {
    User::verifyLogin();
    $user = new User();
    $user = User::getFromSession();
    $post = new Post();
    $post->get((int)$idpost);
    $page = new PageAdmin();
	$page->setTpl("posts-update", [
        "user"=>$user->getValues(),
        "post"=>$post->getvalues()
    ]);
});

$app->post('/admin/posts/:idpost', function($idpost) {
    User::verifyLogin();
    $post = new Post();
    $post->get((int)$idpost);
    $_POST["post_active"] = (isset($_POST["post_active"])) ? 1 : 0;
    $post->setData($_POST);
    $post->save();
    if ((int)$_FILES["file"]["size"] > 0) {
        $post->setPhoto($_FILES["file"]);
    }
    header('Location: /admin/posts');
    exit;
});

?>
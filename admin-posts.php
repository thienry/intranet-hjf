<?php

use \Thiago\PageAdmin;
use \Thiago\DB\Sql;
use \Thiago\Model\Post;
use \Thiago\Model\User;

$app->get("/admin/posts", function() {

    User::verifyLogin();

    $posts = Post::listAll();

    $page = new PageAdmin();

    $page->setTpl("posts", [
        "posts"=>$posts
    ]);


});

$app->get('/admin/posts/create', function() {

	User::verifyLogin();

	$page = new PageAdmin();

	$page->setTpl("posts-create");

});


?>
<?php

use \Thiago\PageAdmin;
use \Thiago\DB\Sql;
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

	$page = new PageAdmin();

	$page->setTpl("posts-create", [

        "user"=>$user->getValues()
    
    ]);

});


?>
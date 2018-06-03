<?php

use \Thiago\Model\User;
use \Thiago\Model\Post;
use \Thiago\Model;

function getUserName() {

	$user = User::getFromSession();
    
    return $user->getdesname();

}

function getUserId() {

	$user = User::getFromSession();
    
    return $user->getid_user();

}

function formatDate($date) {

    return date('d/m/Y', strtotime($date));

}

function cortaStr($texto) {

    return substr($texto, 0, 100);

}

function totalPosts() {

    $totals = Post::getPostsTotals();

    return $totals['nrqtd'];

}

?>
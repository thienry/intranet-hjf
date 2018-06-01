<?php

use \Thiago\Model\User;


function getUserName() {

	$user = User::getFromSession();
    
    return $user->getdesname();

}

function getUserId() {

	$user = User::getFromSession();
    
    return $user->getid_user();

}

?>
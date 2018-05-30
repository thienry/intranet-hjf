<?php

use \Thiago\Model\User;


function getUserName() {

	$user = User::getFromSession();
    
    return $user->getdesname();

}

?>
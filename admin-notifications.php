<?php

use \Thiago\PageAdmin;
use \Thiago\Model\Notificacao;
use \Thiago\Model\User;

/**
 * Get Route List all Notifications stored
 */
$app -> get("/admin/notifications", function() {
  User::verifyLogin();

	$user = new User();
	$user = User::getFromSession();

  $notifications = Notificacao::getNotifications();

  $page = new PageAdmin();
	$page->setTpl("notifications", array(
		"notifications"=>$notifications,
		"user"=>$user->getValues()
	));
});

$app -> get('/admin/notifications/create', function() {
	User::verifyLogin();

	$user = new User();
	$user = User::getFromSession();

	$page = new PageAdmin();
	$page->setTpl("notifications-create", [
		"user"=>$user->getValues()
	]);
});

$app -> post("/admin/notifications/create", function() {
	User::verifyLogin();

	$notification = new Notificacao();
	$notification -> setData($_POST);
	$notification -> save();

	header("Location: /admin/notifications");
	exit;
});

$app -> get('/admin/notifications/:id_notificacao', function($notificationId) {
	User::verifyLogin();

	$user = new User();
	$user = User::getFromSession();
  
	$notification = new Notificacao();
	$notification -> getSingleNotification((int)$notificationId);

	$page = new PageAdmin();
	$page->setTpl("notification-details", array(
		"notification"=>$notification->getValues(),
		"user"=>$user->getValues()
	));
});

?>
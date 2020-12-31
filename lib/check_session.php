<?php
	require_once("dbconnect.php");
	
	if(!isset($_SESSION['username'])){
		header('Location: login.php');
		exit();
	}
?>
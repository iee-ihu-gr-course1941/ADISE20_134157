<?php
$host = 'localhost';
$db = 'adise20_plakoto';
require_once "config_local.php";

$user = $DB_USER;
$pass = $DB_PASS;
$nopass = '';

if(gethostname() ==  'users.iee.ihu.gr'){
	$mysqli = new mysqli($host, $user, $pass, $db, null, 'home/students/it134157/mysql/run/mysl.sock');
} else {
	$mysqli = new mysqli($host, $user, $nopass, $db);
}

if($mysqli -> connect_errno){
	echo "Failed to connect to MySQL: (" .
	$mysqli -> connect_errno . ") " . $mysqli -> connect_error;
}

?>
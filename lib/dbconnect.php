<?php
// Rebooted Version
require_once "config_local.php";

if(!session_id()) SESSION_START(); // If there is no session, start one.

$host = 'localhost';
$db = 'adise';
$user = $DB_USER;
$pass = $DB_PASS;

// Connection
if(gethostname() == 'users.iee.ihu.gr') {
	$mysqli = new mysqli($host, $user, $pass, $db, null,'/home/student/it/2013/it134157/mysql/run/mysql.sock');
} else {
    $mysqli = new mysqli($host, $user, $pass, $db);
    echo("DEBUG: XAMP Database.");
}

if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . 
    $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

?>


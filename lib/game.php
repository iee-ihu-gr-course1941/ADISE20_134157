<?php
function show_status(){
	global $mysqli;

	$sql = 'SELECT * FROM game_status';
	$st = $mysql -> prepare($sql);
	
	$st -> execute();
	$res = $st -> get_result();
	
	header('Content-type: application/json');
	print json_encode($res -> fetch_all(MYSQL_ASSOC), JSON_PRETTY_PRINT);
}
?>

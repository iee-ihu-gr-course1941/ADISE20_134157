<?php

function sendMessage($input){
	$username = $_SESSION['username'];
	global $mysqli;
	$msg = $input['message'];
	$sql = "INSERT INTO posts(msg,username) VALUES (?,?) ";
	$stmt = $mysqli->prepare($sql);
	$stmt ->bind_param('ss', $msg, $username);
	
	if($stmt->execute()){
		header('Content-type: application/json');
		print json_encode(['successmesg'=>"Message was sent successfully."]);
	}else{
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"Message was not sent."]);
		exit;
	}
} // End of sendMessage


function loadChat(){
	global $mysqli;
	$sql = "SELECT * FROM posts ";
	$result = $mysqli->query($sql);
	$rows = array();

	if($result->num_rows>0){
		while($row = $result->fetch_assoc()){
			//echo '<div class="bot-inbox inbox"><div class="msg-header"><p><b>'.$row['username'].'</b>: '.$row['msg'].'</p></div></div>';
			$rows[] = $row;
		}
		header('Content-type: application/json');
		print json_encode($rows, JSON_PRETTY_PRINT);
	}else{
		echo "0 results";
	} // End of if
} // End of loadChat

?>
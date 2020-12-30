<?php
include("dbconnect.php");

if(isset($_REQUEST['action'])){
	global $mysqli;
	
	$username = $_SESSION['username'];

	switch($_REQUEST['action']){
		case "SendMessage":
			$msg = $_REQUEST['message'];
			$sql = "INSERT INTO posts(msg,username) VALUES (?,?) ";
			$stmt = $mysqli->prepare($sql);
			$stmt ->bind_param('ss', $msg, $username);
			$stmt->execute();
			$result = $stmt->get_result();
			$result = $mysqli->query($sql);
			
			echo 1;
		break;

		case "getChat":
			$sql = "SELECT * FROM posts ";
			$result = $mysqli->query($sql);

			if($result->num_rows>0){
				while($row = $result->fetch_assoc()){
					echo '<div class="bot-inbox inbox"><div class="msg-header"><p><b>'.$row['username'].'</b>: '.$row['msg'].'</p></div></div>';
				}
			}else{
				echo "0 results";
			}

			break;
	}
}

?>
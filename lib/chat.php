<?php
  include("dbconnect.php");
  header('Content-type: application/json');
  $input = json_decode(file_get_contents('php://input'),true);

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
			}


			break;

		default:  header("HTTP/1.1 404 Not Found");
                  exit;
	}
}

?>
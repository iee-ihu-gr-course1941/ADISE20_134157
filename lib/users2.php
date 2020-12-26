<?php	
	function register_user($input) {
		//print_r($input);
		if($input['password'] != $input['repeat_password']){
			header("HTTP/1.1 400 Bad Request");
			print json_encode(['errormesg'=>"Passwords do not match."]);
			exit;
		} // End of password check	
		if(!isset($input['username']) || !isset($input['password'])) {
			header("HTTP/1.1 400 Bad Request");
			print json_encode(['errormesg'=>"All fields are required.."]);
			exit;
		} // End of empty field check
		
		$username = $input['username'];
		$password = $input['password'];
		global $mysqli;
		
		$sql = 'SELECT COUNT(*) AS C players WHERE username=? AND password=? ';
		$st = $mysqli->prepare($sql);
		$st->bind_param('ss', $username, $password);
		$st->execute();
		$res = $st->get_result();
		$r = $res->fetch_all(MYSQLI_ASSOC);
		
		if($r[0]['c']>0) {
			header("HTTP/1.1 200 OK");
			print json_encode(['success'=>"Welcome, " .$username]);
			exit;
		}else{
			$sql = 'INSERT INTO players(username,password) VALUES(?,?) ';
			$st2 = $mysqli->prepare($sql);
			$st2->bind_param('ss', $username, $password);
			$st2->execute();
		}
		
		header('Content-type: application/json');
		print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);	
	}
	
	function handle_user($method, $b, $input){
		if($method=='GET'){show_user($input);}
		else if($method=='PUT'){register_user($input);}
	}
?>
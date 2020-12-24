<?php
	ini_set('display_errors','on' );
	
	require_once "lib/dbconnect.php";
	require_once "lib/register.php";	
	
	$method = $_SERVER['REQUEST_METHOD'];
	$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
	$input = json_decode(file_get_contents('php://input'),true);
	if(isset($_SERVER['HTTP_X_TOKEN'])) {
		$input['token']=$_SERVER['HTTP_X_TOKEN'];
	}
	
	function handle_player($method, $request, $input){
		switch($b=array_shift($request)){
			case '':
			case 'register':
				handle_user($method, $b, $input);
				break;
			default:
				header("HTTP/1.1 404 Not Found");
				print json_encode(['errormesg'=>"Player $b not found."]);
				break;
		}
	}
?>
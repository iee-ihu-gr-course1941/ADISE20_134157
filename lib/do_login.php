<?php 
  include("dbconnect.php");
  header('Content-type: application/json');
  $input = json_decode(file_get_contents('php://input'),true);

  global $mysqli;

  $username = $input['username'];
  $password = md5($input['password']);

  $sql = "SELECT username FROM users WHERE username=? AND password=?";
  $stmt = $mysqli->prepare($sql);
  $stmt ->bind_param('ss', $username, $password);
  $stmt->execute();
  $result = $stmt->get_result();
  if($result->num_rows == 1){
      // setcookie("username",$username, time()+86400); // Destroy cookie after a day
      $_SESSION['loggedIN'] = '1';
      $_SESSION['username'] = $username; // $_POST['usernamePHP'];
      header('Content-type: application/json');
      print json_encode($result->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
  }else{
    header("HTTP/1.1 400 Bad Request");
    print json_encode(['errormesg'=>"Make sure account already exists or input data is correct!"]);
    //exit('Make sure account already exists or input data is correct!');
  }
?>
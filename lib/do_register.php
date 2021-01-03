<?php 
  include("dbconnect.php");
  header('Content-type: application/json');
  $input = json_decode(file_get_contents('php://input'),true);

  global $mysqli;

  $username = $input['username'];
  $password = md5($input['password']);

  $sql = 'SELECT COUNT(*) AS c FROM users WHERE username=? ';
  $stmt = $mysqli->prepare($sql);
  $stmt ->bind_param('s', $username);
  $stmt->execute();
  $result = $stmt->get_result();
  $row = $result->fetch_all(MYSQLI_ASSOC);
  if($row[0]['c']>0) {
    header("HTTP/1.1 400 Bad Request");
    print json_encode(['errormesg'=>"Username $username is already set. Please select another username."]);
  }else{
    $sql = "INSERT INTO users(username,password) VALUES(?,?) ";
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param('ss',$username, $password);   

    if($stmt->execute()){
      header('Content-type: application/json');
      print json_encode($result->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
    }else{
      header("HTTP/1.1 400 Bad Request");
      print json_encode(['errormesg'=>"Query was not executed..."]);
    }
  }
?>
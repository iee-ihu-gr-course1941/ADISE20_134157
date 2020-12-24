<?php 
  include("dbconnect.php");
  header('Content-type: application/json');

  // If already logged in
  //if(isset($_SESSION['loggedIN'])){
    //header('Location: index.php');
  //}

  if(isset($_POST['register'])){
    global $mysqli;
    $username = mysqli_real_escape_string($mysqli, $_POST['usernamePHP']);
    $password = md5(mysqli_real_escape_string($mysqli, $_POST['passwordPHP']));

    $sql = 'SELECT COUNT(*) AS c FROM users WHERE username=? ';
    $stmt = $mysqli->prepare($sql);
    $stmt ->bind_param('s', $username);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_all(MYSQLI_ASSOC);
    if($row[0]['c']>0) {
      header("HTTP/1.1 400 Bad Request");
      print json_encode(['errormesg'=>"Player $username is already set. Please select another username."]);
      exit("Player $username is already set. Please select another username.");
    }else{
      $sql = "INSERT INTO users(username,password) VALUES(?,?) ";
      $stmt = $mysqli->prepare($sql);
      $stmt->bind_param('ss',$username,$password);   

      if($stmt->execute()){
        exit ("Register success.");
      }else{
        exit ("Query could not execute !");
      }
    }
  }
?>
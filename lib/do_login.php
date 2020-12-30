<?php 
  include("dbconnect.php");
  header('Content-type: application/json');
  $input = json_decode(file_get_contents('php://input'),true);
  // If already logged in
  if(isset($_SESSION['username'])){
    header('Location: ../index.php');
  }
  
  global $mysqli;

  $username = $input['username'];
  $password = md5($input['password']);

  $sql = "SELECT user_id FROM users WHERE username=? AND password=?";
  $stmt = $mysqli->prepare($sql);
  $stmt ->bind_param('ss', $username, $password);
  $stmt->execute();
  $result = $stmt->get_result();
  if($result->num_rows == 1){
      // setcookie("username",$username, time()+86400); // Destroy cookie after a day
      $_SESSION['loggedIN'] = '1';
      $_SESSION['username'] = $username; // $_POST['usernamePHP'];
      header('Content-type: application/json');
      print  json_encode($input, JSON_PRETTY_PRINT);
  }else{
    exit('Wrong inputs. Please try again.');
  }
?>
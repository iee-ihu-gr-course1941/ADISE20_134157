<?php 
  include("dbconnect.php");
  header('Content-type: application/json');

  // If already logged in
  if(isset($_SESSION['username'])){
    header('Location: index.php');
  }

  if(isset($_POST['login'])){
    //$connection = new mysqli('localhost', 'root', '', 'adise');

    //$username = $connection->real_escape_string($_POST['usernamePHP']);
    //$password = $connection->real_escape_string($_POST['passwordPHP']);
    //$password = md5($connection->real_escape_string($_POST['passwordPHP']));

    global $mysqli;
    $username = mysqli_real_escape_string($mysqli, $_POST['usernamePHP']);
    $password = md5(mysqli_real_escape_string($mysqli, $_POST['passwordPHP']));
    //$data = $mysqli->query("SELECT user_id FROM users WHERE username='$username' AND password='$password'");
    $sql = "SELECT user_id FROM users WHERE username=? AND password=?";
    $stmt = $mysqli->prepare($sql);
    $stmt ->bind_param('ss', $username, $password);
    $stmt->execute();
    $result = $stmt->get_result();
    if($result->num_rows == 1){
      // setcookie("username",$username, time()+86400); // Destroy cookie after a day
      $_SESSION['loggedIN'] = '1';
      $_SESSION['username'] = $_POST['usernamePHP'];
      exit('Login success.');
    }else{
      exit('Wrong inputs. Please try again.');
    }
  }
?>
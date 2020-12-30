<?php
	require_once("lib/dbconnect.php");

	//SESSION_START();
	
	if(!isset($_SESSION['username'])){
		header('Location: login.php');
		exit();
	}
?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Project 2020 For Adise">
    <meta name="author" content="it134157">
    <title>ADISE20_134157</title>
	
	<link rel="icon" href="https://static.thenounproject.com/png/502075-200.png">

    <link href="bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/dashboard.css" rel="stylesheet">
	<link href="css/mychat.css" rel="stylesheet">

	<!-- <link href="css/mycss.css" rel="stylesheet"> -->
		
    <script src="bootstrap/jquery-3.2.1.min.js"></script>
    <script src="bootstrap/popper.min.js"></script>
    <script src="bootstrap/bootstrap.min.js"></script>
    <script src="js/ajax.js"></script>
	<script src="js/main.js"></script>

	<script src="js/tavli.js"></script>
		
	<link href="css/mybackgammon.css" rel="stylesheet">
	<!-- <script src="js/mychess.js"></script> -->

</head>
	<body>
		<header>
			<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
				<a class="navbar-brand" href="#">Πλακωτό</a>
		        <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
	        	</button>
	
				<div class="collapse navbar-collapse" id="navbarsExampleDefault">
			        <ul class="navbar-nav mr-auto">
			            <li class="nav-item active">
				            <a class="nav-link" href="#main" id='btn_main'>Αρχική</a>
			            </li>
						<li class="nav-item">
				            <a class="nav-link" href="#game" id='btn_rules'>Game</a>
		    	        </li>
			            <li class="nav-item">
				            <a class="nav-link" href="#rules" id='btn_rules'>Κανόνες</a>
		    	        </li>
					</ul>

				    <a class="nav-link" href="logout.php" id='btn_rules'>Αποσύνδεση</a>

				</div>
			</nav>
		</header>
		
		<div class="container-fluid">
			
			<div class="row">
				<main id='maincontent' role="main" class="col-sm-9 ml-sm-auto col-md-11 pt-3">
				
				</main>
			</div>

			<div class="wrapper">
				<div id="title" class="title">Online Chat room</div>

				<div id="form" class="form">
				<!-- Chat posts are here -->
				</div>

				<div class="typing-field">
					<div class="input-data">
						<input id="message-data" type="text" placeholder="Type message.." required>
						<button id="chat-send-btn">Send</button>
					</div>
				</div>
			</div>
		</div>

		

<div class="board_gui">

<h1>ΤΑΒΛΙ</h1>

<div class = "board">
  <div class="left-bin">
    <div class="top-row">
      <div class="arrow-down odd"></div>
      <div class="arrow-down even"></div>
      <div class="arrow-down odd"></div>
      <div class="arrow-down even"></div>
      <div class="arrow-down odd"></div>
      <div class="arrow-down even"></div>
    </div>

    <div class="bottom-row"> 
      <div class="arrow-up odd"></div>
      <div class="arrow-up even"></div>
      <div class="arrow-up odd"></div>
      <div class="arrow-up even"></div>
      <div class="arrow-up odd"></div>
      <div class="arrow-up even"></div>
    </div>
  </div> 
  
  <div class = "middle-bar"></div>

  <div class = "right-bin">
       <div class="top-row">
      <div class="arrow-down odd"></div>
      <div class="arrow-down even"></div>
      <div class="arrow-down odd"></div>
      <div class="arrow-down even"></div>
      <div class="arrow-down odd"></div>
      <div class="arrow-down even"></div>
    </div>

    <div class="bottom-row"> 
      <div class="arrow-up odd"></div>
      <div class="arrow-up even"></div>
      <div class="arrow-up odd"></div>
      <div class="arrow-up even"></div>
      <div class="arrow-up odd"></div>
      <div class="arrow-up even"></div>
      </div>
  </div>


<div class="piece_1" draggable="true"></div>
<div class="piece_2" draggable="true"></div>
<div class="piece_3" draggable="true"></div>
<div class="piece_4" draggable="true"></div>
<div class="piece_5" draggable="true"></div>
<div class="piece"></div>

</div>

<div class="chess_test"> 
  <div id='chess_board'>
  </div>
      <br/>
  <div id='game_initializer'>
    <input id='username' value=<?php echo $_SESSION['username']?>> 
    
    <select id='pcolor'>
      <option value='W'>W</option>
      <option value='B'>B</option>
    </select>
    
    <button id='chess_login' class='btn btn-primary'>ΕΙΣΟΔΟΣ ΣΤΟ ΠΑΙΧΝΙΔΙ</button><br>
  </div>

  <div id='game_info'>
  	<p>Test</p>
  </div>

  <div id='move_div'>
    Δώσε κίνηση (x1 y1 x2 y2): <input id='the_move'>  <button id='do_move' class='btn btn-primary'>ΚΑΝΕ ΤΗΝ ΚΙΝΗΣΗ</button><br>
  </div>
    <br/>
    <br/>
  <button id='chess_reset' class='btn btn-primary'>ΕΝΑΡΞΗ/RESET</button>
    <br>
</div>
</div>


	</body>
</html>

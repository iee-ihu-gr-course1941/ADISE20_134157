<?php
	require_once("lib/check_session.php");
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
		
    <script src="bootstrap/jquery-3.2.1.min.js"></script>
    <script src="bootstrap/popper.min.js"></script>
    <script src="bootstrap/bootstrap.min.js"></script>
    <script src="js/ajax.js"></script>
	<script src="js/main.js"></script>

	<script src="js/tavli.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<link href="css/mybackgammon.css" rel="stylesheet">

  	<script src="jquery-ui-1.12.1/jquery-ui.min.js"></script>
  	<link href="jquery-ui-1.12.1/jquery-ui.min.css" rel="stylesheet">
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>

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
<span class="dice1"></span><span class="dice2"></span>

  <div class="left-bin">
  </div>  

  <div class = "middle-bar"></div>
  <div class = "right-bin">
  </div>


<div class="piece_1" draggable="true"><img src="images/W.png"/></div>
<div class="piece_2" draggable="true"><img src="images/W.png"/></div>
<div class="piece_3" draggable="true"><img src="images/W.png"/></div>
<div class="piece_4" draggable="true"><img src="images/W.png"/></div>
<div class="piece_5" draggable="true"><img src="images/W.png"/></div>

<div class="piece"></div>

<div class="piece_6" draggable="true"><img src="images/B.png"/></div>
<div class="piece_7" draggable="true"><img src="images/B.png"/></div>
<div class="piece_8" draggable="true"><img src="images/B.png"/></div>
<div class="piece_9" draggable="true"><img src="images/B.png"/></div>
<div class="piece_10" draggable="true"><img src="images/B.png"/></div>

</div>

  <div class="chess_test"> 
    <div id='chess_board'>
    </div>

    <br/>
    
    <div id='game_initializer'>
      <input id='username' value=<?php echo $_SESSION['username'] ?> > 

      <select id='pcolor'>
        <option value='W'>W</option>
        <option value='B'>B</option>
      </select>

      <button id='chess_login' class='btn btn-primary'>ΕΙΣΟΔΟΣ ΣΤΟ ΠΑΙΧΝΙΔΙ</button><br>
    </div>

    <div id='game_info'>
    </div>

    <div id='move_div'>
      
      Δώσε κίνηση (x1 y1 x2 y2): <input id='the_move'>  <button id='do_move' class='btn btn-primary'>ΚΑΝΕ ΤΗΝ ΚΙΝΗΣΗ</button><br>
      <br><br>
      Δώσε κίνηση (x1 y1): <input id='the_move_src'> (x2 y2):
      <select id='the_move_dest'></select>
      
      <button id='dice' class='btn btn-primary'>ΡΙΞΕ ΖΑΡΙΑ</button><br><br>
      <button id='do_move2' class='btn btn-primary'>ΚΑΝΕ ΤΗΝ ΚΙΝΗΣΗ 2</button><br>
    </div>

    <br/><br/>
    <button id='chess_reset' class='btn btn-primary'>ΕΝΑΡΞΗ/RESET</button><br>
  </div>

</div>


	</body>
</html>

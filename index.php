<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
  		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   		<meta name="description" content="ADISE Project 2020">
   		<meta name="author" content="134157">
  		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
		<title>ADISE20_134157</title>
	
		<link rel="icon" href="https://static.thenounproject.com/png/502075-200.png">

    	<link href="bootstrap/bootstrap.min.css" rel="stylesheet">
    	<link href="bootstrap/dashboard.css" rel="stylesheet">
		
    	<script src="bootstrap/jquery-3.2.1.min.js"></script>
    	<script src="bootstrap/popper.min.js"></script>
    	<script src="bootstrap/bootstrap.min.js"></script>
    	<!-- <script src="js/ajax.js"></script> -->
		<link href="css/mybackgammon.css" rel="stylesheet">
		<script src="js/mybackgammon.js"></script>
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
		    	        <li class="nav-item">
		    		        <a class="nav-link" href="#login" id='btn_login'>Σύνδεση</a>
		    	        </li>
					</ul>
				</div>
			</nav>
		</header>
		
		<div class="container-fluid">
			<div class="row">
				<main id='maincontent' role="main" class="col-sm-9 ml-sm-auto col-md-10 pt-3">
				<div id='backgammon_board'>
	</div>
	
	<button id='backgammon_reset' class='btn btn-primary'>ΕΝΑΡΞΗ</button><br>
				</main>
			</div>
		</div>
	</body>
</html>

<html>
	<head>
		<title>Login page</title>
		<link href="css/mycss.css" rel="stylesheet">
	</head>
	<body>

	<form method="POST" action="login.php" align="center">
		<div class="container">
	    	<h1>Log In</h1>
	    		<p>Please fill in this form to log in.</p>
	    	<hr>

	    	<input type="text" placeholder="Enter Username" id="username" name="username">
			<input type="password" placeholder="Enter Password" id="password" name="psw">

		    <div class="clearfix">
	      		<button type="button" id="login" class="signinbtn">Login</button>
	    	</div>
	    	<div class="container register" align="center">
    			<p>Do not have an account yet? <a href="register.php">Register</a>.</p>
  			</div>
		</div>
		<p id="response"></p>
	</form>

	<script
		src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous">
	</script>	
	<script type="text/javascript" src="js/main.js"></script>
	</body>
</html>
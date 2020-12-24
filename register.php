<html>
    <head>
        <title>Register page</title>
        <link href="css/mycss.css" rel="stylesheet">
    </head>
    <body>
        <form method="POST" action="register.php" align="center">
          <div class="container">
            <h1>Sign Up</h1>
            <p>Please fill in this form to create an account.</p>
            <hr>

            <label for="username"><b>Username</b></label>
            <input type="text" placeholder="Enter Username" id="username" name="username" required>

            <label for="psw"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" id="psw" name="psw" required>

            <label for="psw-repeat"><b>Repeat Password</b></label>
            <input type="password" placeholder="Repeat Password" id="psw-repeat" name="psw-repeat" required>

            <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

            <div class="clearfix">
              <button type="button" id="signupbtn" class="signupbtn">Sign Up</button>
            </div>
            <div class="container signin" align="center">
                <p>Already have an account? <a href="login.php">Sign In</a>.</p>
            </div>
            <p id="response"><p>
          </div>
        </form>
        <script
          src="https://code.jquery.com/jquery-3.5.1.min.js"
          integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
          crossorigin="anonymous"></script> 
        <script type="text/javascript" src="js/main.js"> </script>
    </body>
</html>
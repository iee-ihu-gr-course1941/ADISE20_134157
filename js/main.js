$(document).ready(function(){
	var board={};

	$("#login").click(function(){
		var username = $("#username").val();
		var password = $("#password").val();
					
		if(username == "" || password == ""){
			alert("You must fill all fields.");
		}else{
			$.ajax({
				url: 'lib/do_login.php',
				method: 'POST',
				dataType: "json",
				contentType: 'application/json',
				data: JSON.stringify( {username: username, password: password }),
				success: function(data){alert("Welcome, "+data[0].username+".");window.location = "index.php";}
			});
		}
	});// End of Login

	$("#signupbtn").click(function(){
		var username = $("#username").val();
		var password = $("#psw").val();
		var repeatpassword = $("#psw-repeat").val();

		if(password != repeatpassword){	
			alert("Passwords do not match. Please try again.");
		}else if(username == "" || password == "" || repeatpassword == ""){
			alert("You must fill all fields.");
		}else{
			$.ajax({
				url: 'lib/do_register.php',
				method: 'POST',
				dataType: "json",
				contentType: 'application/json',
				data: JSON.stringify( {username: username, password: password }),
				success: function(){window.location = "login.php";}
			});
		}
	});// End of signup




}); // End of $(document).ready(function()


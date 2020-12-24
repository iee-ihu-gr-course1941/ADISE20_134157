$(document).ready(function(){
	$("#login").click(function(){
		var username = $("#username").val();
		var password = $("#password").val();
					
		if(username == "" || password == ""){
			alert("You must fill all fields.");
		}else{
			$.ajax({
				url: 'lib/do_login.php',
				method: 'POST',
				data:{
					login: 1,
					usernamePHP: username,
					passwordPHP: password
				},
				success: function(response){
					$("#response").html(response);
					if(response.indexOf('success')>=0){
						window.location = 'index.php';
					}
				},
				dataType: 'text'
			});
		}
	});// End of Login

	$("#signupbtn").click(function(){
		var username = $("#username").val();
		var password = $("#psw").val();
		var repeatpassword = $("#psw-repeat").val();

		if(password != repeatpassword){
			alert("Passwords do not match. Please try again.");
		} 
					
		if(username == "" || password == "" || repeatpassword == ""){
			alert("You must fill all fields.");
		}else{
			$.ajax({
				url: 'lib/do_register.php',
				method: 'POST',
				data:{
					register: 1,
					usernamePHP: username,
					passwordPHP: password,
					repeatpasswordPHP: repeatpassword
				},
				success: function(response){
					$("#response").html(response);
					if(response.indexOf('success')>=0){
						window.location = 'login.php';
					}
				},
				error: function(response){
					$("#response").html(response);
				},
				dataType: 'text'
			});
		}
	});// End of signup

});
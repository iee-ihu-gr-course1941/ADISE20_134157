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
		}else if(username == "" || password == "" || repeatpassword == ""){
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



	$("#send-btn").click(function(){
		var msg = $("#msg").val();

			$.ajax({
				url: 'send.php',
				method: 'POST',
				data:{
					send: 1,
					msg: msg
				},
				success: function(response){
					$("#response").html(response);
					if(response.indexOf('success')>=0){
						window.location = 'index.php';
					}
				},
				error: function(response){
					$("#response").html(response);
				},
				dataType: 'text'
			});
			
	});// End of signup


	loadChat();

	$("#chat-send-btn").click(function(){
		var message = $("#message-data").val();

		$.post('lib/chat.php?action=SendMessage&message='+message, function(response){
			loadChat();
			$("#message-data").val('');
		});
	});

	function loadChat(){
		$.post('lib/chat.php?action=getChat', function(response){
				$(".form").html(response);
			});
	}

	/*
	setInterval(function(){
		loadChat(); // Each second call function loadChat()	
	},2000);
	*/

	/* Show Chat window */
	$("#message-data").focus(function(){
		document.getElementById('title').style.display = "block";
		document.getElementById('form').style.display = "block";
	});

	$("#title").click(function(){
		document.getElementById('title').style.display = "none";
		document.getElementById('form').style.display = "none";
	});
});
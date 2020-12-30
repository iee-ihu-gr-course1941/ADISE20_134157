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
				dataType: "json",
				contentType: 'application/json',
				data: JSON.stringify( {username: username, password: password }),
				success: function(data){alert("Welcome, "+data.username+".");window.location = "index.php";}
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
				success: function(){window.location = "login.php";},
				error: function(response){
					$("#response").html(response);
				}
			});
		}
	});// End of signup

	$("#send-btn").click(function(){
		var msg = $("#msg").val();

		$.ajax({
			url: 'send.php',
			method: 'POST',
			dataType: "json",
			contentType: 'application/json',
			data: JSON.stringify( {msg: msg }),
			success: function(data){window.location = "index.php";},
			error: function(data){
				$("#response").html(data);
			}
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

	
	setInterval(function(){
		loadChat(); // Each second call function loadChat()	
	},2000);
	

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
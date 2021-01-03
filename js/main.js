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
				success: function(data){alert("Welcome, "+data[0].username+".");window.location = "index.php";},
				error: login_error
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
				error: login_error
			});
		}
	});// End of signup

	loadChat();

	$("#chat-send-btn").click(function(){
		var message = $("#message-data").val();

		$.post('lib/chat.php?action=SendMessage&message='+message, function(response){
			loadChat();
			$("#message-data").val('');
		})
	});



	function loadChat(){
		/*
		$.post('lib/chat.php?action=getChat', function(response){
				$(".form").html(response);
			});
		*/

		$.ajax({
			url: 'lib/chat.php?action=getChat',
			method: 'GET',
			dataType: "json",
			contentType: 'application/json',
			success: function(data){
				console.log(data);
				board=data;
				$('.form').html(""); // Clear everything before creating new divs
				for(var i=0;i<data.length;i++) {
					var o = data[i];
					var username = o.username;
					var message = o.msg;
					var user = $("#username").val();

					var user_type;

					if(user != username){user_type = "bot-inbox inbox";}
					else{user_type = "user-inbox inbox";}

					var im = '<div class="'+user_type+'"><div class="msg-header"><p><b>'+username+'</b>: '+message+'</p></div></div>';	
					$('.form').append(im);
				}
			}
			});
	}

	setInterval(function(){loadChat();},2000); // Each second call function loadChat()	

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

function show_messages(data){
	

}

function login_error(data,y,z,c) {
	var x = data.responseJSON;
	alert(x.errormesg);
}
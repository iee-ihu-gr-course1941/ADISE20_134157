var me={token:null,piece_color:null};
var game_status={};
var board={};
var last_update=new Date().getTime();
var timer=null;
var counter =0;

$(function () {
	draw_empty_board();
	fill_board();

	loadChat();
	
	$('#chess_login').click( login_to_game);
	$('#chess_reset').click( reset_board);
	$('#do_move').click( do_move);
	$('#move_div').hide();
	game_status_update();
	$('#the_move_src').change( update_moves_selector);
	$('#do_move2').click( do_move2);

	$("#chat-send-btn").click(sendMessage); // Send message
	$('#dice').click(rollDice); // Roll dice

	setInterval(function(){loadChat();},2000); // Each second call function loadChat()	

	/* Show Chat window */
	$("#message-data").focus(function(){
		document.getElementById('title').style.display = "block";
		document.getElementById('form').style.display = "block";
	});

	/* Hide Chat window */
	$("#title").click(function(){
		document.getElementById('title').style.display = "none";
		document.getElementById('form').style.display = "none";
	});	
});


function draw_empty_board(p) {
	/*
	if(p!='B') {p='W';}
	var draw_init = {
		'W': {i1:8,i2:0,istep:-1,j1:1,j2:9,jstep:1},
		'B': {i1:1,i2:9,istep:1, j1:8,j2:0,jstep:-1}
	};
	var s=draw_init[p];

    Fields are numbered in the following way,
    no matter what pieces the user is playing with:
    - Field 0 - top left
    - Field 1 - bottom left
    - Field 2 - top right
    - Field 3 - bottom right
      
    Fields are arrange on the board in the following way:
      
    +13-14-15-16-17-18------19-20-21-22-23-24-+
    |                  |   |                  |
    |      Field 0     |   |      Field 2     |
    |                  |   |                  |
    |                  |   |                  |
    |                  |   |                  |
    |                  |   |                  | 
    |                  |   |                  |
    |                  |   |                  |
    |                  |   |                  |
    |      Field 1     |   |      Field 3     |
    |                  |   |                  |
    +12-11--10--9--8--7-------6--5--4--3--2--1-+ 
      
	*/

	if(p!='B') {p='W';}
	var draw_init = {
		'W': {i1:7,i2:1,istep:-1,i3:12,i4:6,istep:-1},
		'B': {i1:13,i2:19,istep:1, i3:19,i4:25,istep:1}
	};
	var s=draw_init[p];
	
	// Field 0 - Top Left
	var typeClass;
	var top_row ='<div class="top-row">';
	for (var i=s.i1; i!=s.i2; i+= s.istep) {
      	typeClass = i % 2 === 0 ? 'even' : 'odd';
      	top_row += '<div class="arrow-down '+typeClass+'"></div>';
  	}
  	top_row +='</div>';

  	// Field 1 - Bottom Left
  	var bottom_row ='<div class="bottom-row">';
	for (var i=s.i3; i!=s.i4; i+= s.istep) {
      	typeClass = i % 2 === 0 ? 'odd' : 'even';
      	bottom_row += '<div class="arrow-up '+typeClass+'"></div>';
  	}
  	bottom_row +='</div>';
  	

  	// Field 2 - Top Right
  	var top_row ='<div class="top-row">';
	for (var i=s.i1; i!=s.i2; i+= s.istep) {
      	typeClass = i % 2 === 0 ? 'even' : 'odd';
      	top_row += '<div class="arrow-down '+typeClass+'"></div>';
  	}
  	top_row +='</div>';

  	// Field 3 - Bottom Right
  	var bottom_row ='<div class="bottom-row">';
	for (var i=s.i3; i!=s.i4; i+= s.istep) {
      	typeClass = i % 2 === 0 ? 'odd' : 'even';
      	bottom_row += '<div class="arrow-up '+typeClass+'"></div>';
  	}
  	bottom_row +='</div>';

  	if (counter == 0){
  		$('.left-bin').append(top_row, bottom_row);
  		$('.right-bin').append(top_row, bottom_row);
  	}

  	counter=1;

	$('.chess_square').click(click_on_piece);
}

function fill_board() {
	$.ajax({url: "chess.php/board/", 
		headers: {"X-Token": me.token},
		success: fill_board_by_data });
}

function reset_board() {
	$.ajax({url: "chess.php/board/", headers: {"X-Token": me.token}, method: 'POST',  success: fill_board_by_data, drawDice_by_data });
	$('#move_div').hide();
	$('#game_initializer').show(2000);
}
function fill_board_by_data(data) {
	board=data;
	for(var i=0;i<data.length;i++) {
		var o = data[i];
		var id = '#square_'+ o.x +'_' + o.y;
		var c = (o.piece!=null)?o.piece_color + o.piece:'';
		var pc= (o.piece!=null)?'piece'+o.piece_color:'';
		var im = (o.piece!=null)?'<img src="images/"'+c+'.png">':'';
		$(id).addClass(o.b_color+'_square').html(im);
	}
 
	$('.ui-droppable').droppable( "disable" );
		
	if(me && me.piece_color!=null) {
		$('.piece'+me.piece_color).draggable({start: start_dragging, stop: end_dragging, revert:true});
	}
	if(me.piece_color!=null && game_status.p_turn==me.piece_color) {
		$('#move_div').show(1000);
	} else {
		$('#move_div').hide(1000);
	}
}

function login_to_game() {
	if($('#username').val()=='') {
		alert('You have to set a username');
		return;
	}
	var p_color = $('#pcolor').val();
	draw_empty_board(p_color);
	fill_board();
	
	$.ajax({url: "chess.php/players/"+p_color, 
			method: 'PUT',
			dataType: "json",
			headers: {"X-Token": me.token},
			contentType: 'application/json',
			data: JSON.stringify( {username: $('#username').val(), piece_color: p_color}),
			success: login_result,
			error: login_error});
}

function login_result(data) {
	me = data[0];
	$('#game_initializer').hide();
	update_info();
	game_status_update();
}

function login_error(data,y,z,c) {
	var x = data.responseJSON;
	alert(x.errormesg);
}

function game_status_update() {
	clearTimeout(timer);
	$.ajax({url: "chess.php/status/", success: update_status, headers: {"X-Token": me.token} });
}

function update_status(data) {
	last_update=new Date().getTime();
	var game_stat_old = game_status;
	game_status=data[0];
	drawDice_by_data(data);
	update_info();
	clearTimeout(timer);
	if(game_status.p_turn==me.piece_color &&  me.piece_color!=null) {
		x=0;
		// do play
		if(game_stat_old.p_turn!=game_status.p_turn) {
			fill_board();
			
		}
		$('#move_div').show(1000);
		timer=setTimeout(function() { game_status_update();}, 4000);
	} else {
		// must wait for something
		$('#move_div').hide(1000);
		timer=setTimeout(function() { game_status_update();}, 4000);
	}
 	
}

function update_info(){
	$('#game_info').html("I am Player: "+me.piece_color+", my name is "+me.username +'<br>Token='+me.token+'<br>Game state: '+game_status.status+', '+ game_status.p_turn+' must play now.');
}

function do_move() {
	var s = $('#the_move').val();
	
	var a = s.trim().split(/[ ]+/);
	if(a.length!=4) {
		alert('Must give 4 numbers');
		return;
	}
	$.ajax({url: "chess.php/board/piece/"+a[0]+'/'+a[1], 
			method: 'PUT',
			dataType: "json",
			contentType: 'application/json',
			data: JSON.stringify( {x: a[2], y: a[3]}),
			headers: {"X-Token": me.token},
			success: move_result,
			error: login_error});
	
}

function move_result(data){
	drawDice_by_data(data);
	game_status_update();
	fill_board_by_data(data);
}

function update_moves_selector() {
	$('.chess_square').removeClass('pmove').removeClass('tomove');
	var s = $('#the_move_src').val();
	var a = s.trim().split(/[ ]+/);
	$('#the_move_dest').html('');
	if(a.length!=2) {
		return;
	}
	var id = '#square_'+ a[0]+'_'+a[1];
	$(id).addClass('tomove');
	for(i=0;i<board.length;i++) {
		if(board[i].x==a[0] && board[i].y==a[1] && board[i].moves && Array.isArray(board[i].moves)) {
			for(m=0;m<board[i].moves.length;m++) {
				$('#the_move_dest').append('<option value="'+board[i].moves[m].x+' '+board[i].moves[m].y+'">'+board[i].moves[m].x+' '+board[i].moves[m].y+'</option>');
				var id = '#square_'+ board[i].moves[m].x +'_' + board[i].moves[m].y;
				$(id).addClass('pmove');
			}
		}
	}
}

function do_move2() {
	$('#the_move').val($('#the_move_src').val() +' ' + $('#the_move_dest').val());
	$('.chess_square').removeClass('pmove').removeClass('tomove');
	do_move();
}

function click_on_piece(e) {
	var o=e.target;
	if(o.tagName!='TD') {o=o.parentNode;}
	if(o.tagName!='TD') {return;}
	
	var id=o.id;
	var a=id.split(/_/);
	$('#the_move_src').val(a[1]+' ' +a[2]);
	update_moves_selector();
}

function start_dragging ( event, ui ) {
	var x;
	
	var o=event.target.parentNode;
	var id = o.id;
	var a = id.trim().split(/_/);
	
	$(o).addClass('tomove');
	for(i=0;i<board.length;i++) {
		if(board[i].x==a[1] && board[i].y==a[2] && board[i].moves && Array.isArray(board[i].moves)) {
			for(m=0;m<board[i].moves.length;m++) {
				$('#the_move_dest').append('<option value="'+board[i].moves[m].x+' '+board[i].moves[m].y+'">'+board[i].moves[m].x+' '+board[i].moves[m].y+'</option>');
				var id = '#square_'+ board[i].moves[m].x +'_' + board[i].moves[m].y;
				$(id).addClass('pmove').droppable({drop: dropping}).droppable('enable');
			}
		}
	}
}

function dropping( event, ui ) {
    var x;

	ui.draggable[0].validMove=1;
	var id = this.id;
	var a2 = id.split(/_/);
	var a1 = ui.draggable[0].parentNode.id.split(/_/);

	$('#the_move').val(a1[1]+' '+a1[2]+' '+a2[1]+' '+a2[2]);
	$('.chess_square').removeClass('pmove').removeClass('tomove');
	do_move();
}


function end_dragging ( event, ui ) {
        var x;

	if(this.validMove) {
		this.validMove=0;
		return;
	}
	$('.chess_square').removeClass('pmove').removeClass('tomove');
	this.top=0;
	this.left=0;

}

/**** Dice functions ****/ /**** Dice functions ****/ /**** Dice functions ****/ /**** Dice functions ****/
function rollDice(){
	var dice1 = Math.floor(Math.random()*6)+1;
	var dice2 = Math.floor(Math.random()*6)+1;

	$.ajax({url: "chess.php/board/dice/"+dice1+'/'+dice2, 
			method: 'PUT',
			dataType: "json",
			contentType: 'application/json',
			data: JSON.stringify( {dice1: dice1, dice2: dice2}),
			headers: {"X-Token": me.token}
		});

	//alert("WHITE DICE: "+dice1+" and BLACK DICE: "+dice2);
} // End of rollDice



function drawDice_by_data(data){
	if(data[0].p_turn != null && data[0].dice1 != null && data[0].dice2 != null){
		var d1 = '<img src="images/dw'+data[0].dice1+'.png" />';
		var d2 = '<img src="images/dw'+data[0].dice2+'.png" />';

		$('.dice1').html(d1); $('.dice2').html(d2);		
	}				
} // End of drawDice_by_data


/**** Chat functions ****/ /**** Chat functions ****/ /**** Chat functions ****/ /**** Chat functions ****/
function sendMessage(){
	var message = $("#message-data").val();

	$.post({
		url:'chess.php/chat/?msg='+message, 
		method: 'POST',
		dataType: "json",
		contentType: 'application/json',
		data: JSON.stringify( {message: message})
	})

	$("#message-data").val('');
} // End of sendMessage

function loadChat(){
	$.ajax({
		url: 'chess.php/chat/',
		method: 'GET',
		dataType: "json",
		contentType: 'application/json',
		success: function(data){
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
			} // End of for loop		
		} // End of success
	}); // End of ajax
} // End of loadChat


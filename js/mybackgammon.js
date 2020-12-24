var me={token:null,piece_color:null};
var game_status={};
var board={};
var last_update=new Date().getTime();
var timer=null;

$(function () {
	draw_empty_board();
	fill_board();
	
	$('#chess_login').click( login_to_game);
	$('#chess_reset').click( reset_board);
	$('#do_move').click( do_move);
	$('#move_div').hide();
	game_status_update();
	$('#the_move_src').change( update_moves_selector);
	$('#do_move2').click( do_move2);
});


function draw_empty_board(p) {
	if(p!='B') {p='W';}
	
	var draw_init = {
		'W': {i1:12,i2:0,istep:-1,j1:12,j2:0,jstep:-1},
		'B': {i1:11,i2:0,istep:-1, j1:12,j2:0,jstep:-1}
	};
	
	var s=draw_init[p];
	var t='<table id="chess_table">';
	for(var i=s.i1;i!=s.i2;i+=s.istep) {
		t += '<tr>';
		for(var j=s.j1;j!=s.j2;j+=s.jstep) {
			t += '<td class="chess_square" id="square_'+j+'_'+i+'">' + j +','+i+'</td>'; 
		}
		t+='</tr>';
	}
	t+='</table>';
	
	$('#chess_board').html(t);
	$('.chess_square').click(click_on_piece);
}

function fill_board() {
	$.ajax({url: "plakoto.php/board/", 
		headers: {"X-Token": me.token},
		success: fill_board_by_data });
	
}

function reset_board() {
	$.ajax({url: "plakoto.php/board/", headers: {"X-Token": me.token}, method: 'POST',  success: fill_board_by_data });
	$('#move_div').hide();
	$('#game_initializer').show(2000);
}

function fill_board_by_data(data) {
	for(var i=0;i<data.length;i++) {
		var o = data[i];
		var id = '#square_'+ o.position_x +'_' + o.position_y;
		//var c = (o.checker!=null)?o.checker_color + o.checker:'';
		var c = (o.checker!=null)?o.checker_color:'';
		var im = (o.checker!=null)?'<img class="piece" src="images/'+c+'.png">':'';
		//var im = c;'
		$(id).addClass(o.board_color+'_square').html(im);
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
	
	$.ajax({url: "plakoto.php/players/"+p_color, 
			method: 'PUT',
			dataType: "json",
			contentType: 'application/json',
			data: JSON.stringify( {username: $('#username').val(), checker_color: p_color}),
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
	//return;
}

function game_status_update() {
	clearTimeout(timer);
	$.ajax({url: "plakoto.php/status/", success: update_status,headers: {"X-Token": me.token} });
}

function update_status(data) {
	last_update=new Date().getTime();
	var game_stat_old = game_status;
	game_status=data[0];
	update_info();
	clearTimeout(timer);
	
	if((game_status.player_turn==me.checker_color)  &&  me.checker_color !=null) {
		x=0;
		// do play
		if(game_stat_old.player_turn!=game_status.player_turn) {
			fill_board();
		}
		$('#move_div').show(1000);
		timer=setTimeout(function() { game_status_update();}, 15000);
	} else {
		// must wait for something
		$('#move_div').hide(1000);
		setTimeout(function() { game_status_update();}, 4000);
	}
 	
}

function update_info(){
	//$('#game_info').html("I am Player: "+me.checker_color +", my name is "+me.username +'<br>Token='+me.token+'<br>Game state:  '+ game_status.player_turn+' must play now.');
	$('#game_info').html("I am Player: "+me.checker_color+", my name is "+me.username +'<br>Token='+me.token+'<br>Game state: '+game_status.status+', '+ game_status.player_turn+' must play now.');
}

function do_move() {
	var s = $('#the_move').val();
	
	var a = s.trim().split(/[ ]+/);
	if(a.length!=4) {
		alert('Must give 4 numbers');
		return;
	}
	$.ajax({url: "plakoto.php/board/checker/"+a[0]+'/'+a[1], 
			method: 'PUT',
			dataType: "json",
			contentType: 'application/json',
			data: JSON.stringify( {position_x: a[2], position_y: a[3]}),
			success: move_result,
			error: login_error});
}

function move_result(data){
	game_status_update();
	fill_board_by_data(data);
}


// EXTRA
if (isset($_POST['regusername'])) {
	$username = $_POST['regusername'];
	$password = sha1($_POST['regpassword']);
	$sql = "INSERT INTO users (UserName,UserPassword) VALUES (:UserName,:UserPassword)";
	$q = $_db->prepare($sql);
	$q->execute(array(':UserName'=>$username, ':UserPassword'=>$password));	
	$_SESSION['username'] = $username;
	$output = array("msg"=>"Hello $username! You are now registered! Please log in to use your account", "loggedin"=>"true");
	echo json_encode($output);	
}
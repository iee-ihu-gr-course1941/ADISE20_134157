 
$(function () {
	draw_empty_board();
	fill_board();
});

function draw_empty_board(){
	var t = '<table id="backgammon_table">';
	for(var i=12; i>0; i--){
		t += '<tr>';
		for(var j=12; j>0; j--){
			t += '<td class="backgammon_triangle" id="square__'+j+'_'+i+'">' +j+','+i+'</td>'; 
		}
		t+='</tr>';
	}
	t+='</table>';
	
	$('#backgammon_board').html(tz);	
}

function fill_board() {
	$.ajax({url: "plakoto.php/board/", success: fill_board_by_data });
	
}

function fill_board_by_data(data) {
	for(var i=0;i<data.length;i++) {
		var o = data[i];
		var id = '#square_'+ o.x +'_' + o.y;
		var c = (o.checker!=null)?o.checker_color + o.checker:'';
		var im = (o.checker!=null)?'<img class="checker" src="images/'+c+'.png">':'';
		//var im = c;
		$(id).addClass(o.board_color+'_square_').html(im);
		
	}
}
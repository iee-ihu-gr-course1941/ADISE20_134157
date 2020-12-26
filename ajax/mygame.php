<?php
	include("../lib/chat.php");
?>

<h1>ΤΑΒΛΙ</h1>
	
<div id='chess_board'>
</div>
	<br/>
<div id='game_initializer'>
	<input id='username'> 
	<select id='pcolor'>
		<option value='W'>W</option>
		<option value='B'>B</option>
	</select>
	<button id='chess_login' class='btn btn-primary'>ΕΙΣΟΔΟΣ ΣΤΟ ΠΑΙΧΝΙΔΙ</button><br>
</div>
<div id='game_info'>
</div>
<div id='move_div'>
	Δώσε κίνηση (x1 y1 x2 y2): <input id='the_move'>  <button id='do_move' class='btn btn-primary'>ΚΑΝΕ ΤΗΝ ΚΙΝΗΣΗ</button><br>
</div>
	<br/>
	<br/>
<button id='chess_reset' class='btn btn-primary'>ΕΝΑΡΞΗ/RESET</button>
	<br>


$(function() {
	$(window).on('hashchange', check_status);
	check_status();
});

function check_status() {
	var page = window.location.hash.replace('#','');
	do_goto_page(page);
}

function do_goto_page(page) {
	var btn = page;
	
	switch(btn) {
		case '': 
		case 'main': load_main(); break;
		case 'rules': load_rules(); break;
		default: load_not_found(); break;
	}
}

function load_main() {
	$.ajax('ajax/index.php', { success: show_html_result} );
}

function load_rules() {
	$('.board_gui').hide();
	$('.wrapper').hide();
	$('#maincontent').load('ajax/rules.php');
}

function show_html_result(x,y,z) {
	$('.board_gui').show();
	$('.wrapper').show();
	$('#maincontent').html(x);
}

function load_not_found() {
	$('#maincontent').html('Συνέβη κάποιο σφάλμα. Η σελίδα δεν υπάρχει.');
}

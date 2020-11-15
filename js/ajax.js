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
		case 'login': load_login(); break;
		default: load_not_found(); break;
	}
}

function load_main() {
	$.ajax('ajax/index.php', { success: show_html_result} );
	document.getElementById("BODY").style.backgroundImage = null;
}

function load_rules() {
	$('#maincontent').load('ajax/rules.php');
}

function load_login() {
	$('#maincontent').load('ajax/login.php');
}


function show_html_result(x,y,z) {
	$('#maincontent').html(x);
}


function load_not_found() {
	$('#maincontent').html('Συνέβη κάποιο σφάλμα. Η σελίδα δεν υπάρχει.');
}

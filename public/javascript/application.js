function toggle(img) {
	article = img.parent().parent();
	table = article.find("table");
	visible = table.is(':visible');
	table.toggle();

	prefix = ''; 

	if(!visible) {
		img.attr('src', 'images/minus_alt_16x16.png');
		img.attr('alt', '-');
	}else {
		img.attr('src', 'images/plus_alt_16x16.png');
		img.attr('alt', '+');
	}
}

$(document).ready(function() {
	$( ".window-button" ).click(function() {
		toggle($(this));
		return false;
	});
});


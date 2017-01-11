function viewGraph(){

		$('.column').css('height','0');
		$('table tr').each(function(index) {
			var ha = $(this).children('td').eq(1).text();
			$('#col'+index).animate({height: ha}, 1500).html("<div>"+ha+"</div>");

		});
}
$(document).ready(function(){
	viewGraph();
});


$(function() {
	  var moveLeft = 20;
	  var moveDown = 10;

	  $('a#trigger').hover(function(e) {
		  
	    $('div#pop-up').show();
	      //.css('top', e.pageY + moveDown)
	      //.css('left', e.pageX + moveLeft)
	      //.appendTo('body');
	  }, function() {
	    $('div#pop-up').hide();
	  });

	  $('a#trigger').mousemove(function(e) {
	    $("div#pop-up").css('top', e.pageY + moveDown).css('left', e.pageX + moveLeft);
	  });

	});
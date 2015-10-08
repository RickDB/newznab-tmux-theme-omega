$(document).ready(function(){
	function filter(event){
		var elements = $('table.data:visible tr.filter');
		elements.hide();

		/* quality filter */
		x = event;
		//if(event.currentTarget.at)
		if(event.target.dataset.quality != undefined){
			var quality = event.target.dataset.quality;
		}else{
			var quality = $('#filter-quality button.active').data('quality');
		}
		if(quality){
			elements = elements.filter('[data-name*="' + quality + '"]');
		}
		var values = $('#filter-text').val().split(/\s+/);
		var i = values.length;
		while(i--){
			var value = values[i];
			console.log('value', value);
			if(value)elements = elements.filter('[data-name*="' + values[i] + '"]');
		}
		elements.show();
	}
	$('#filter-text').click(filter).blur(filter).keyup(filter);
	$('#filter-quality button').mouseup(filter);
});

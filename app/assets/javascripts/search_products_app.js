$(document).ready(
	function() {
		$("#search-input").keyup(function() {
			var keyword = $(this).val()
			if (keyword.length > 0) {
				$('#search-hidden-button').click()
			}
			else {
				$.get('products', {keywords: null})		
			}
		})
	}
)

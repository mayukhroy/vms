// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require colorbox-rails
//= require_tree .

	/* Table Search */
	function searchTable(inputVal) {
		var table = $('#searchTable');
		table.find('tr').each(function(index, row) {
				var allCells = $(row).find('td');
				if (allCells.length > 0) {
						var found = false;
						allCells.each(function(index, td) {
								var regExp = new RegExp(inputVal, 'i');
								if (regExp.test($(td).text())) {
										found = true;
										return false;
								}
						});
						if (found == true)
								$(row).show();
						else
								$(row).hide();
				}
		});
	}

	/* Table search */
	$(document).ready(function() {
		$('#search').keyup(function() {
		    searchTable($(this).val());
		});
	}); 
	
	/* Project form validation */

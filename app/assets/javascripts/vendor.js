function validate_email_exists(email){
	var emailExists = false;
	
	$.ajax({
		url: "validate_email_exists",
		async: false,
		type: 'POST',
		data: {
		    email : email
		},
		success: function(result){
			if(result == "") {
				emailExists = false;
			} else {
				emailExists = result;
			}
		}
	});
	return emailExists;
}


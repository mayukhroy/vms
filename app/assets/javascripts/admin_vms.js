	function validate_user(){				
		var error = 0;
		$("#user_email_error").html("");
		$("#user_name_error").html("");
		$("#user_contact_number_error").html("");		
		var email_regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		
		if($("#user_name").val() == '' || ($("#user_name").val() == null)){
			$("#user_name_error").show();
			$("#user_name_error").html("<font color='red' size='1'>Please enter a user name</font>");
			error = 1;
		}		
		if (!email_regex.test($("#user_email").val())){
			$("#user_email_error").show();
			$("#user_email_error").html("<font color='red' size='1'>Please enter a valid email id</font>");
			error = 1;
		}
		
		
		if($("#user_email").val() == '' || ($("#user_email").val() == null)){
			$("#user_email_error").show();
			$("#user_email_error").html("<font color='red' size='1'>Please enter an email id</font>");
			error = 1;
		}
		if($('#user_contact_number').val().length != 10 ){
			$("#user_contact_number_error").show();
			$("#user_contact_number_error").html("<font color='red' size='1'>Please enter a valid contact number</font>");
			error = 1;
		}
		if(!$('#user_contact_number').val().match(/^\d+/)){
			$("#user_contact_number_error").show();
			$("#user_contact_number_error").html("<font color='red' size='1'>Please enter a valid contact number</font>");
			error = 1;
		}
		if($("#user_contact_number").val() == '' || ($("#user_contact_number").val() == null)){
			$("#user_contact_number_error").show();
			$("#user_contact_number_error").html("<font color='red' size='1'>Please enter a contact number</font>");
			error = 1;
		}
		if (error == 1)
		{return false;}
		else
		{ return true;}
	}
	

	function validate_add_user(){				
		var error = 0;
		$("#user_email_error").html("");
		$("#user_name_error").html("");
		$("#user_contact_number_error").html("");		
		var email_regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		
		if($("#user_name").val() == '' || ($("#user_name").val() == null)){
			$("#user_name_error").show();
			$("#user_name_error").html("<font color='red' size='1'>Please enter a user name</font>");
			error = 1;
		}
		$.ajax("user/validate/?email_id="+$("#user_email").val(), {
		
			async: false,
			success: function(result){
				if(result != "") {
					error = 1;
					$("#user_email_error").show();
					$("#user_email_error").html("<font color='red' size='1'>"+result+"</font>");
				}
			}
		});
		
		if (!email_regex.test($("#user_email").val())){
			$("#user_email_error").show();
			$("#user_email_error").html("<font color='red' size='1'>Please enter a valid email id</font>");
			error = 1;
		}
		
		
		if($("#user_email").val() == '' || ($("#user_email").val() == null)){
			$("#user_email_error").show();
			$("#user_email_error").html("<font color='red' size='1'>Please enter an email id</font>");
			error = 1;
		}
		if($('#user_contact_number').val().length != 10 ){
			$("#user_contact_number_error").show();
			$("#user_contact_number_error").html("<font color='red' size='1'>Please enter a valid contact number</font>");
			error = 1;
		}
		if(!$('#user_contact_number').val().match(/^\d+/)){
			$("#user_contact_number_error").show();
			$("#user_contact_number_error").html("<font color='red' size='1'>Please enter a valid contact number</font>");
			error = 1;
		}
		if($("#user_contact_number").val() == '' || ($("#user_contact_number").val() == null)){
			$("#user_contact_number_error").show();
			$("#user_contact_number_error").html("<font color='red' size='1'>Please enter a contact number</font>");
			error = 1;
		}
		if (error == 1)
		{return false;}
		else
		{ return true;}
	}
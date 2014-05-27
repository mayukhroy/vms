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

$(document).ready(function(){
 
$('#create_vendor').on('click',function() {
	alert("cV");
	if (($("#vendor_name").val() == '' || $("#vendor_name").val() == null) && ($("#vendor_email").val() == '' || $("#vendor_email").val() == null))
	{
		$("#vendor_name_error").show();
		$("#vendor_email_error").show();
		return false;
	}
	else if ($("#vendor_email").val() == '' || $("#vendor_email").val() == null)
	{
		$("#vendor_email_error").show();
		$("#vendor_name_error").hide();
		return false;
	}
	else if ($("#vendor_name").val() == '' || $("#vendor_name").val() == null)
	{
		$("#vendor_name_error").show();
		$("#vendor_email_error").hide();
		return false;
	}
	else if (false == validate_email($("#vendor_email").val()))
	{
		$("#valid_email_error").show();
		$("#vendor_email_error").hide();
		return false;
	}
	else if (validate_email_exists($("#vendor_email").val()))
	{	
		$("#vendor_email_error").hide();		
		$("#valid_email_exists_error").show();
		$("#valid_email_exists_error").html("<font color='red' size='1'>"+validate_email_exists($("#vendor_email").val())+"</font>");
		return false;
	}

	return true;  
});

$('#update_vendor').on('click',function() {
	
	alert("UV");
	if (($("#vendor_name").val() == '' || $("#vendor_name").val() == null) && ($("#vendor_email").val() == '' || $("#vendor_email").val() == null))
	{
		$("#vendor_name_error").show();
		$("#vendor_email_error").show();
		return false;
	}
	else if ($("#vendor_email").val() == '' || $("#vendor_email").val() == null)
	{
		$("#vendor_email_error").show();
		$("#vendor_name_error").hide();
		return false;
	}
	else if ($("#vendor_name").val() == '' || $("#vendor_name").val() == null)
	{
		$("#vendor_name_error").show();
		$("#vendor_email_error").hide();
		return false;
	}
	else if (false == validate_email($("#vendor_email").val()))
	{
		$("#valid_email_error").show();
		$("#vendor_email_error").hide();
		return false;
	}
	else if (validate_email_exists($("#vendor_email").val()))
	{	
		$("#vendor_email_error").hide();		
		$("#valid_email_exists_error").show();
		$("#valid_email_exists_error").html("<font color='red' size='1'>"+validate_email_exists($("#vendor_email").val())+"</font>");
		return false;
	}

	return true;  
});

  });
function validate_email(email)
{
  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  if(regex.test(email)==false)
	return false;
  else 
	return true;
}

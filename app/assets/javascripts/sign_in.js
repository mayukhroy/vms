function validate_service()
{

  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  if(regex.test($("#email_field").val())==false)
  {
$("#valid_email_error").show();
$("#email_error").hide();
$("#password_error").show();
return false;
  }
  
  else
  {

if (($("#email_field").val() == '' || $("#email_field").val() == null) &&
($("#password_field").val() == '' || $("#password_field").val() == null))
{
$("#email_error").show();
$("#valid_email_error").hide();
$("#password_error").show();
return false;
}
else if ($("#email_field").val() == '' || $("#email_field").val() == null)
{
$("#email_error").show();
$("#valid_email_error").hide();
$("#password_error").hide();

return false;
}
else if ($("#password_field").val() == '' || $("#password_field").val() == null)
{
$("#email_error").hide();
$("#valid_email_error").hide();
$("#password_error").show();
return false;
}
   }	
return true;
}

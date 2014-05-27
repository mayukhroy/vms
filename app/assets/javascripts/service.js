function validate_service(){

	var passedValidation = false;
	if($("#service_name").val() == '' || ($("#service_name").val() == null)){
		$("#service_name_error").show();
		$("#service_name_error").html("<font color='red' size='1'>Please enter a service name</font>");
		passedValidation = true;
		return false;
	}
	
	var service_name = $("#service_name").val();
	var vendor_id = $("#service_vendor_id").val();
	$.ajax("service/validate/?service_name="+service_name+"&vendor_id="+vendor_id, {
		async: false,
		success: function(result){
			if(result == "") {
				passedValidation = true;
			} else {
				$("#service_name_error").show();
				$("#service_name_error").html("<font color='red' size='1'>"+result+"</font>");
			}
		}
	});
	return passedValidation;
}
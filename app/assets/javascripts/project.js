function validate_project(){

	var passedValidation = false;
	if($("#project_name").val() == '' || ($("#project_name").val() == null)){
		$("#project_name_error").show();
		$("#project_name_error").html("<font color='red' size='1'>Please enter a project name</font>");
		passedValidation = true;
		return false;
	}
	
	var value = $("#project_name").val();
	$.ajax("validate/"+value, {
		async: false,
		success: function(result){
			if(result == "") {
				passedValidation = true;
			} else {
				$("#project_name_error").show();
				$("#project_name_error").html("<font color='red' size='1'>"+result+"</font>");
			}
		}
	});
	return passedValidation;
}
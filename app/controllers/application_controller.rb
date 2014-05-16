class ApplicationController < ActionController::Base
  protect_from_forgery
  #layout 'template'
end


  #def after_sign_in_path_for(resource)
#	if user_signed_in?
	#		if current_user.id == 1
#				redirect_to :controller=>'admin', :action=>'index'
#			else
#				redirect_to :controller=>'vendors', :action=>'index'
	#		end
	#	end	
  #  end

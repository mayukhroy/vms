class HomeController < ApplicationController
	def index
		if user_signed_in?
			if current_user.id == 1
				redirect_to :controller=>'admin', :action=>'index'
			else
				redirect_to :controller=>'vendors', :action=>'index'
			end
		end		
	end	
end

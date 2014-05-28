class HomeController < ApplicationController
	
	  before_filter :signed_in_user
  
	  private
	  def signed_in_user
	     if !user_signed_in?
			redirect_to :controller=>'devise/sessions', :action=>'new'	
		end				
	  end
	
	def index
		if user_signed_in?
			if current_user.id ==1
				redirect_to :controller=>'admin', :action=>'index'
			else
				redirect_to :controller=>'vendors', :action=>'index'
			end
		else
				redirect_to :controller=>'devise/sessions', :action=>'new'
		end		
	end	
	
	def show_invitations
		@invitations = Invitation.all
	end
	
	def edit
		@user = User.find(current_user.id)
	end
	
	def update
		@user = User.find(current_user.id)
		respond_to do |format|
			if @user.update_attributes(params[:user])
				#format.html { redirect_to @vendor, notice: 'Vendor was successfully updated.' }
				flash[:notice]= 'User was successfully updated.'
				format.html { redirect_to action: 'index'}
				#redirect_to({ action: 'index' }, alert: "Something serious happened")
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end	
	
end

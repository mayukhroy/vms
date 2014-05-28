class AdminController < ApplicationController
  #Recent Admin
  before_filter :signed_in_user
  layout false, only: [:new, :show, :edit, :validate_user]
  
  def index
	  
   @empty_user = false
   @users = User.where(role: 'USER').paginate(:page => params[:page], :per_page => 15)
    if !@users.present?
	    @empty_user = true
    end
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
     @user = User.find(params[:id])
  end
  

  # Not yet completed
  def create
	  
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
	#UserMailer.welcome_email(@user).deliver
        format.html { redirect_to admin_index_path, notice: 'User was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  
    def update	    
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
	flash[:notice]= 'User was successfully updated.'
	format.html { redirect_to action: 'index'}
      else
	flash[:notice]= 'Please try again'
        format.html { render action: "edit" }
      end
    end
  end

  # Not yet completed
  def destroy
    @user = User.find(params[:id])    
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_index_url }
    end
  end
  
  def validate_user
	@user_email_exist = User.find_by_email(params[:email_id]).present?
  end
  
  
  private
  def signed_in_user
	if !user_signed_in?
		redirect_to :controller=>'devise/sessions', :action=>'new'	
	end	
	if current_user.present? && User.find(current_user.id).role == "USER"
		redirect_to :controller=>'vendor', :action=>'index'
	end
  end
end

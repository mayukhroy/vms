class AdminController < ApplicationController
  
  def index
   # @users = User.find_by_role("USER")
   @users = User.where(role: 'USER')

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
	UserMailer.welcome_email(@user).deliver
        format.html { redirect_to admin_index_path, notice: 'User was successfully created.' }
      else
        format.html { render action: "new" }
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
end

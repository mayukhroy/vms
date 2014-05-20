class UserMailer < ActionMailer::Base
  default from: "amitsinha559.com"
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
  
  def current_user_email(user, project)
	@user = user
	@project = project
	@vendor = Vendor.find(@project.vendor_id).name
    
	@services_ids = @project.services_ids
    
	@url  = 'http://example.com/login'
	mail(to: @user.email, subject: 'Current User')
  end
  
  def actual_user_email(user, project)
	@user = user
	@project = project
	@vendor = Vendor.find(@project.vendor_id).name
    
	@services_ids = @project.services_ids
    
	@url  = 'http://example.com/login'
	mail(to: @user.email, subject: 'Actual User')
  end

  def vendor_email(user, project)
	@user = user
	@project = project
	@vendor = Vendor.find(@project.vendor_id).name
    
	@services_ids = @project.services_ids
    
	@url  = 'http://example.com/login'
	mail(to: @user.email, subject: 'Vendor')
end

end
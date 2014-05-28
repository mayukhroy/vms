class ApplicationController < ActionController::Base
  protect_from_forgery
  #layout 'template'
rescue_from ActiveRecord::RecordNotFound, :with => :not_found
rescue_from ActionController::RoutingError, :with => :rescue_404

  def not_found
   redirect_to :controller=>'vendors', :action=>'index'
  end
  
  def rescue_404
     redirect_to :controller=>'vendors', :action=>'index'
  end
   
end
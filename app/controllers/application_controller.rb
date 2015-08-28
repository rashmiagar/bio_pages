class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :signed_in?, :current_user

  before_action :authenticate, :except => :landing
  def current_user
  	@current_user ||= User.find_by(id: session[:user_id])
  end

  def sign_in(user)
    self.current_user = user
    return user
  end

  def signed_in?
    !current_user.nil?
  end

  def authenticate
    if signed_in?
    else
      redirect_to root_url, :notice => "Please Sign in."
    end
  end

  def current_user=(user)
  	@current_user = user
  	session[:user_id]= user.nil? ? nil : user.id
  end

  def sign_out
    self.current_user=nil
    session[:user_id]=nil
  end

  private

  def authorize
    
    unless signed_in? && params[:id].to_i == current_user.id
      
      redirect_to root_url, :notice => "Permission Denied!!" 
    end
  end
end

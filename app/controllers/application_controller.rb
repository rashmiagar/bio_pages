class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def current_user
  	@current_user ||= User.find_by_(id: session[:user_id])
  end

  def sign_in

  end

  def current_user=(user)
  	@current_user = user
  	session[:user_id]= user.nil ? nil : user.id
  end
end

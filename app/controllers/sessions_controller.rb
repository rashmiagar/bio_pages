class SessionsController < ApplicationController

  def new
  end

  # def create
  #   user = User.find_by(email: params[:session][:email].downcase)
  #   if user && user.authenticate(params[:session][:password])
  #     sign_in user
  #     redirect_back_or user
  #   else
  #     flash.now[:error] = 'Invalid email/password combination'
  #     render 'new'
  #   end
  # end
  def create
    @authorization = User.find_by_uid(auth_hash["uid"])
    if @authorization
      #sign_in @authorization, :event => :authentication
      render :text => "Welcome back #{@authorization.name}! You have already signed up."  
    else
      user = User.new :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"], :uid => auth_hash["uid"]
      user.save

      render :text => "Hi #{user.name}! You've signed up."
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end



  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
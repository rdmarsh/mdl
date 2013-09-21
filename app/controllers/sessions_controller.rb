class SessionsController < ApplicationController
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:info] = "Logged in!"
      redirect_to root_url
    else
      flash.now.alert = "Email or password is invalid."
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:info] = "Logged out!"
    redirect_to root_url
  end
end

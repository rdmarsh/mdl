class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    
    @user = User.new(user_params)
    
    if @user.save
      # write a create message to the activity log
      @user.create_activity :create
      
      session[:user_id] = @user.id
      flash[:info] = "Thank you for signing up!"
      redirect_to root_url
    else
      flash[:error] = "There were some errors"
      render "new"
    end
  end
  
  private
  
  # for allowing editing on fields
  def user_params
    unless params[:user].blank?
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end
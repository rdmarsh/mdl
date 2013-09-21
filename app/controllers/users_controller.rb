class UsersController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @users = User.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@users)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      # write a create message to the activity log
      @user.create_activity :create, owner: current_user
      
      session[:user_id] = @user.id
      flash[:info] = "Thank you for signing up!"
      redirect_to root_url
    else
      flash[:error] = "There were some errors"
      render "new"
    end
  end
  
  private
  
  # for sorting columns
  def sort_column
    SupportLevel.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def user_params
    unless params[:user].blank?
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end
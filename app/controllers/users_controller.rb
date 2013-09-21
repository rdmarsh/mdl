class UsersController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @users = User.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@users)
  end
  
  def show
    @user = User.find(params[:id])
    respond_with(@user)
  end
  
  def new
    @user = User.new
    respond_with(@user)
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.session
      # write a create message to the activity log
      @user.create_activity :create, owner: current_user
      
      session[:user_id] = @user.id
      flash[:info] = "Thank you for signing up '" + @user.name + "'"
      redirect_to root_url
    else
      flash[:error] = "Could not create user '" + @user.name + "'"
      render "new"
    end
    
    respond_with(@user)
  end
  
  def edit
    @user = User.find(params[:id])
    respond_with(@user)
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(user_params)
      # write an update message to the activity log
      @user.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated user '" + @user.email + "'"
    else
      flash[:error] = "Could not update user '" + @user.email + "'"
    end
    
    respond_with(@user)
  end
  
  def destroy
    @user = User.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @user.create_activity :destroy, owner: current_user
    if @user.destroy
      flash[:info] = "Successfully deleted user '" + @user.name + "'"
    else
      flash[:error] = "Could not delete user '" + @user.name + "'"
    end
    
    respond_with(@user)
  end
  
  private
  
  # for sorting columns
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def user_params
    unless params[:user].blank?
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end
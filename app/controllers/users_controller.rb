# OneMDL is a ruby on rails based application designed to collate information
# about IT assets. It is designed to be most useful to System Administrators
# and Service Desk personal.
# 
# Copyright (C) 2013 David Marsh
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

class UsersController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @users = User.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@users)
  end
  
  def show
    @user = User.friendly.find(params[:id])
    respond_with(@user)
  end
  
  def new
    @user = User.new
    respond_with(@user)
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      # write a create message to the activity log
      @user.create_activity :create, owner: current_user
      
      session[:user_id] = @user.id
      flash[:info] = "Thank you for signing up '" + @user.email + "'"
      redirect_to root_url
    else
      flash[:error] = "Could not create user '" + @user.email + "'"
      render "new"
    end
  end
  
  def edit
    @user = User.friendly.find(params[:id])
    respond_with(@user)
  end
  
  def update
    @user = User.friendly.find(params[:id])
    
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
    @user = User.friendly.find(params[:id])
    
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
      params.require(:user).permit(:email, :password, :password_confirmation, :avatar_url)
    end
  end
end
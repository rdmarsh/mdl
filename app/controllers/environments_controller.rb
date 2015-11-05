# OneMDL is a ruby on rails based application designed to collate information
# about IT assets. It is designed to be most useful to System Administrators
# and Service Desk personal.
# 
# Copyright (C) 2013-2015 David Marsh
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

class EnvironmentsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @environments = Environment.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@environments)
  end
  
  def show
    @environment = Environment.friendly.find(params[:id])
    respond_with(@environment)
  end
  
  def new
    @environment = Environment.new
    respond_with(@environment)
  end
  
  def create
    @environment = Environment.new(environment_params)
    
    if @environment.save
      # write a create message to the activity log
      @environment.create_activity :create, owner: current_user
      flash[:info] = "Successfully created environment '" + @environment.name + "'"
    else
      flash[:error] = "Could not create environment '" + @environment.name + "'"
    end
    
    respond_with(@environment)
  end
  
  def edit
    @environment = Environment.friendly.find(params[:id])
    respond_with(@environment)
  end
  
  def update
    @environment = Environment.friendly.find(params[:id])
    
    if @environment.update_attributes(environment_params)
      # write an update message to the activity log
      @environment.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated environment '" + @environment.name + "'"
    else
      flash[:error] = "Could not update environment '" + @environment.name + "'"
    end
    
    respond_with(@environment)
  end
  
  def destroy
    @environment = Environment.friendly.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @environment.create_activity :destroy, owner: current_user
    if @environment.destroy
      flash[:info] = "Successfully deleted environment '" + @environment.name + "'"
    else
      flash[:error] = "Could not delete environment '" + @environment.name + "'"
    end
    
    respond_with(@environment)
  end
  
  private
  
  # for sorting columns
  def sort_column
    Environment.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def environment_params
    params.require(:environment).permit!
  end
end
# OneMDL is a ruby on rails based application designed to collate information
# about IT assets. It is designed to be most useful to System Administrators
# and Service Desk personal.
# 
# Copyright (C) 2013-2014 David Marsh
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

class SystemsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @systems = System.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@systems)
  end
  
  def show
    @system = System.friendly.find(params[:id])
    respond_with(@system)
  end
  
  def new
    @system = System.new
    respond_with(@system)
  end
  
  def create
    @system = System.new(system_params)
    
    if @system.save
      # write a create message to the activity log
      @system.create_activity :create, owner: current_user
      flash[:info] = "Successfully created system '" + @system.name + "'"
    else
      flash[:error] = "Could not create system '" + @system.name + "'"
    end
    
    respond_with(@system)
  end
  
  def edit
    @system = System.friendly.find(params[:id])
    respond_with(@system)
  end
  
  def update
    @system = System.friendly.find(params[:id])
    
    if @system.update_attributes(system_params)
      # write an update message to the activity log
      @system.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated system '" + @system.name + "'"
    else
      flash[:error] = "Could not update system '" + @system.name + "'"
    end
    
    respond_with(@system)
  end
  
  def destroy
    @system = System.friendly.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @system.create_activity :destroy, owner: current_user
    if @system.destroy
      flash[:info] = "Successfully deleted system '" + @system.name + "'"
    else
      flash[:error] = "Could not delete system '" + @system.name + "'"
    end
    
    respond_with(@system)
  end
  
  private
  
  # for sorting columns
  def sort_column
    System.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def system_params
    params.require(:system).permit!
  end
end

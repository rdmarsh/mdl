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

class ServiceLevelsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @service_levels = ServiceLevel.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@service_levels)
  end
  
  def show
    @service_level = ServiceLevel.friendly.find(params[:id])
    respond_with(@service_level)
  end
  
  def new
    @service_level = ServiceLevel.new
    respond_with(@service_level)
  end
  
  def create
    @service_level = ServiceLevel.new(service_level_params)
    
    if @service_level.save
      # write a create message to the activity log
      @service_level.create_activity :create, owner: current_user
      flash[:info] = "Successfully created service level '" + @service_level.name + "'"
    else
      flash[:error] = "Could not create service level '" + @service_level.name + "'"
    end
    
    respond_with(@service_level)
  end
  
  def edit
    @service_level = ServiceLevel.friendly.find(params[:id])
    respond_with(@service_level)
  end
  
  def update
    @service_level = ServiceLevel.friendly.find(params[:id])
    
    if @service_level.update_attributes(service_level_params)
      # write an update message to the activity log
      @service_level.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated service level '" + @service_level.name + "'"
    else
      flash[:error] = "Could not update service level '" + @service_level.name + "'"
    end
    
    respond_with(@service_level)
  end
  
  def destroy
    @service_level = ServiceLevel.friendly.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @service_level.create_activity :destroy, owner: current_user
    if @service_level.destroy
      flash[:info] = "Successfully deleted service level '" + @service_level.name + "'"
    else
      flash[:error] = "Could not delete service level '" + @service_level.name + "'"
    end
    
    respond_with(@service_level)
  end
  
  private
  
  # for sorting columns
  def sort_column
    ServiceLevel.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def service_level_params
    params.require(:service_level).permit!
  end
end
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

class DeviceTypesController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @device_types = DeviceType.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@device_types)
  end
  
  def show
    @device_type = DeviceType.friendly.find(params[:id])
    respond_with(@device_type)
  end
  
  def new
    @device_type = DeviceType.new
    respond_with(@device_type)
  end
  
  def create
    @device_type = DeviceType.new(device_type_params)
    
    if @device_type.save
      # write a create message to the activity log
      @device_type.create_activity :create, owner: current_user
      flash[:info] = "Successfully created device type '" + @device_type.name + "'"
    else
      flash[:error] = "Could not create device type '" + @device_type.name + "'"
    end
    
    respond_with(@device_type)
  end
  
  def edit
    @device_type = DeviceType.friendly.find(params[:id])
    respond_with(@device_type)
  end
  
  def update
    @device_type = DeviceType.friendly.find(params[:id])
    
    if @device_type.update_attributes(device_type_params)
      # write an update message to the activity log
      @device_type.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated device type '" + @device_type.name + "'"
    else
      flash[:error] = "Could not update device type '" + @device_type.name + "'"
    end
    
    respond_with(@device_type)
  end
  
  def destroy
    @device_type = DeviceType.friendly.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @device_type.create_activity :destroy, owner: current_user
    if @device_type.destroy
      flash[:info] = "Successfully deleted device type '" + @device_type.name + "'"
    else
      flash[:error] = "Could not delete device type '" + @device_type.name + "'"
    end
    
    respond_with(@device_type)
  end
  
  private
  
  # for sorting columns
  def sort_column
    DeviceType.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def device_type_params
    params.require(:device_type).permit!
  end
end
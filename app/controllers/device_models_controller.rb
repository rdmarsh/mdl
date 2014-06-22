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

class DeviceModelsController < ApplicationController
  respond_to :html, :xml, :json, :csv
  helper_method :sort_column, :sort_direction
  
  def index
    @device_models = DeviceModel.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@device_models)
  end
  
  def show
    @device_model = DeviceModel.friendly.find(params[:id])
    respond_with(@device_model)
  end
  
  def new
    @device_model = DeviceModel.new
    respond_with(@device_model)
  end
  
  def create
    @device_model = DeviceModel.new(device_model_params)
    
    if @device_model.save
      # write a create message to the activity log
      @device_model.create_activity :create, owner: current_user
      flash[:info] = "Successfully created device model '" + @device_model.name + "'"
    else
      flash[:error] = "Could not create device model '" + @device_model.name + "'"
    end
    
    respond_with(@device_model)
  end
  
  def edit
    @device_model = DeviceModel.friendly.find(params[:id])
    respond_with(@device_model)
  end
  
  def update
    @device_model = DeviceModel.friendly.find(params[:id])
    
    if @device_model.update_attributes(device_model_params)
      # write an update message to the activity log
      @device_model.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated device model '" + @device_model.name + "'"
    else
      flash[:error] = "Could not update device model '" + @device_model.name + "'"
    end
    
    respond_with(@device_model)
  end
  
  def destroy
    @device_model = DeviceModel.friendly.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @device_model.create_activity :destroy, owner: current_user
    if @device_model.destroy
      flash[:info] = "Successfully deleted device model '" + @device_model.name + "'"
    else
      flash[:error] = "Could not delete device model '" + @device_model.name + "'"
    end
    
    respond_with(@device_model)
  end
  
  def graph
  end
  
  private
  
  # for sorting columns
  def sort_column
    DeviceModel.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def device_model_params
    params.require(:device_model).permit!
  end
end
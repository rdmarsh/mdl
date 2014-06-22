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

class NetworkUsesController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @network_uses = NetworkUse.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@network_uses)
  end
  
  def show
    @network_use = NetworkUse.friendly.find(params[:id])
    respond_with(@network_use)
  end
  
  def new
    @network_use = NetworkUse.new
    respond_with(@network_use)
  end
  
  def create
    @network_use = NetworkUse.new(network_use_params)
    
    if @network_use.save
      # write a create message to the activity log
      @network_use.create_activity :create, owner: current_user
      flash[:info] = "Successfully created network use '" + @network_use.name + "'"
    else
      flash[:error] = "Could not create network use '" + @network_use.name + "'"
    end
    
    respond_with(@network_use)
  end
  
  def edit
    @network_use = NetworkUse.friendly.find(params[:id])
    respond_with(@network_use)
  end
  
  def update
    @network_use = NetworkUse.friendly.find(params[:id])
    
    if @network_use.update_attributes(network_use_params)
      # write an update message to the activity log
      @network_use.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated network use '" + @network_use.name + "'"
    else
      flash[:error] = "Could not update network use '" + @network_use.name + "'"
    end
    
    respond_with(@network_use)
  end
  
  def destroy
    @network_use = NetworkUse.friendly.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @network_use.create_activity :destroy, owner: current_user
    if @network_use.destroy
      flash[:info] = "Successfully deleted network use '" + @network_use.name + "'"
    else
      flash[:error] = "Could not delete network use '" + @network_use.name + "'"
    end
    
    respond_with(@network_use)
  end
  
  private
  
  # for sorting columns
  def sort_column
    NetworkUse.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def network_use_params
    params.require(:network_use).permit!
  end
end

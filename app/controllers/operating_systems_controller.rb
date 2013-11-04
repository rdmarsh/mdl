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

class OperatingSystemsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction

  def index
    @operating_systems = OperatingSystem.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@operating_systems)
  end

  def show
    @operating_system = OperatingSystem.friendly.find(params[:id])
    respond_with(@operating_system)
  end

  def new
    @operating_system = OperatingSystem.new
    respond_with(@operating_system)
  end

  def create
    @operating_system = OperatingSystem.new(operating_system_params)
  
    if @operating_system.save
      # write a create message to the activity log
      @operating_system.create_activity :create, owner: current_user
      flash[:info] = "Successfully created OperatingSystem '" + @operating_system.name + "'"
    else
      flash[:error] = "Could not create OperatingSystem '" + @operating_system.name + "'"
    end
  
    respond_with(@operating_system)
  end

  def edit
    @operating_system = OperatingSystem.friendly.find(params[:id])
    respond_with(@operating_system)
  end

  def update
    @operating_system = OperatingSystem.friendly.find(params[:id])
  
    if @operating_system.update_attributes(operating_system_params)
      # write an update message to the activity log
      @operating_system.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated OperatingSystem '" + @operating_system.name + "'"
    else
      flash[:error] = "Could not update OperatingSystem '" + @operating_system.name + "'"
    end
  
    respond_with(@operating_system)
  end

  def destroy
    @operating_system = OperatingSystem.friendly.find(params[:id])
  
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @operating_system.create_activity :destroy, owner: current_user
    if @operating_system.destroy
      flash[:info] = "Successfully deleted OperatingSystem '" + @operating_system.name + "'"
    else
      flash[:error] = "Could not delete OperatingSystem '" + @operating_system.name + "'"
    end
  
    respond_with(@operating_system)
  end

  private

  # for sorting columns
  def sort_column
    OperatingSystem.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  # for allowing editing on fields
  def operating_system_params
    params.require(:operating_system).permit!
  end
  end
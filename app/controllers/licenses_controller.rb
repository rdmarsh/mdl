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

class LicensesController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @licenses = License.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@licenses)
  end
  
  def show
    @license = License.friendly.find(params[:id])
    respond_with(@license)
  end
  
  def new
    @license = License.new
    respond_with(@license)
  end
  
  def create
    @license = License.new(license_params)
    
    if @license.save
      # write a create message to the activity log
      @license.create_activity :create, owner: current_user
      flash[:info] = "Successfully created license '" + @license.id.to_s + "'"
    else
      flash[:error] = "Could not create license '" + @license.id.to_s + "'"
    end
    
    respond_with(@license)
  end
  
  def edit
    @license = License.friendly.find(params[:id])
    respond_with(@license)
  end
  
  def update
    @license = License.friendly.find(params[:id])
    
    if @license.update_attributes(license_params)
      # write an update message to the activity log
      @license.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated license '" + @license.id.to_s + "'"
    else
      flash[:error] = "Could not update license '" + @license.id.to_s + "'"
    end
    
    respond_with(@license)
  end
  
  def destroy
    @license = License.friendly.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @license.create_activity :destroy, owner: current_user
    if @license.destroy
      flash[:info] = "Successfully deleted license '" + @license.id.to_s + "'"
    else
      flash[:error] = "Could not delete license '" + @license.id.to_s + "'"
    end
    
    respond_with(@license)
  end
  
  private
  
  # for sorting columns
  def sort_column
    License.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def license_params
    params.require(:license).permit!
  end
end
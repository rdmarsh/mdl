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

class OrganisationsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  # before_action :load_address
  
  def index
    @organisations = Organisation.order(sort_column + " " + sort_direction).page(params[:page])
  end
  
  def show
    @organisation = Organisation.friendly.find(params[:id])
  end
  
  def new
    @organisation = Organisation.new
  end
  
  def create
    @organisation = Organisation.new(organisation_params)
    
    if @organisation.save
      # write a create message to the activity log
      @organisation.create_activity :create, owner: current_user
      flash[:info] = "Successfully created organisation '" + @organisation.name + "'"
    else
      flash[:error] = "Could not create organisation '" + @organisation.name + "'"
    end
    respond_with(@organisation)
  end
  
  def edit
    @organisation = Organisation.friendly.find(params[:id])
  end
  
  def update
    @organisation = Organisation.friendly.find(params[:id])
    
    if @organisation.update_attributes(organisation_params)
      # write an update message to the activity log
      @organisation.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated organisation '" + @organisation.name + "'"
    else
      flash[:error] = "Could not update organisation '" + @organisation.name + "'"
    end
    respond_with(@organisation)
  end
  
  def destroy
    @organisation = Organisation.friendly.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @organisation.create_activity :destroy, owner: current_user
    if @organisation.destroy
      flash[:info] = "Successfully deleted organisation '" + @organisation.name + "'"
    else
      flash[:error] = "Could not delete organisation '" + @organisation.name + "'"
    end
    respond_with(@organisation)
  end
  
  private

  def sort_column
    Organisation.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def organisation_params
    params.require(:organisation).permit!
  end
end
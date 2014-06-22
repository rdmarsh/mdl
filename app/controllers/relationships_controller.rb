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

class RelationshipsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @relationships = Relationship.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@relationships)
  end
  
  def show
    @relationship = Relationship.friendly.find(params[:id])
    respond_with(@relationship)
  end
  
  def new
    @relationship = Relationship.new
    respond_with(@relationship)
  end
  
  def create
    @relationship = Relationship.new(relationship_params)
    
    if @relationship.save
      # write a create message to the activity log
      @relationship.create_activity :create, owner: current_user
      flash[:info] = "Successfully created relationship '" + @relationship.name + "'"
    else
      flash[:error] = "Could not create relationship '" + @relationship.name + "'" 
    end
    
    respond_with(@relationship)
  end
  
  def edit
    @relationship = Relationship.friendly.find(params[:id])
    respond_with(@relationship)
  end
    
  def update
    @relationship = Relationship.friendly.find(params[:id])
    
    if @relationship.update_attributes(relationship_params)
      # write an update message to the activity log
      @relationship.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated relationship '" + @relationship.name + "'"
    else
      flash[:error] = "Could not update relationship '" + @relationship.name + "'"
    end
    
    respond_with(@relationship)
  end
  
  def destroy
    @relationship = Relationship.friendly.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @relationship.create_activity :destroy, owner: current_user
    if @relationship.destroy
      flash[:info] = "Successfully deleted relationship '" + @relationship.name + "'"
    else
      flash[:error] = "Could not delete relationship '" + @relationship.name + "'"
    end
    
    respond_with(@relationship)
  end
  
  private
  
  # for sorting columns
  def sort_column
    Relationship.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def relationship_params
    params.require(:relationship).permit!
  end
end
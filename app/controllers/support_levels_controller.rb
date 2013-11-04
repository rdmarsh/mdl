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

class SupportLevelsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @support_levels = SupportLevel.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@support_levels)
  end
  
  def show
    @support_level = SupportLevel.friendly.find(params[:id])
    respond_with(@support_level)
  end
  
  def new
    @support_level = SupportLevel.new
    respond_with(@support_level)
  end
  
  def create
    @support_level = SupportLevel.new(support_level_params)
    
    if @support_level.save
      # write a create message to the activity log
      @support_level.create_activity :create, owner: current_user
      flash[:info] = "Successfully created support level '" + @support_level.name + "'"
    else
      flash[:error] = "Could not create support level '" + @support_level.name + "'"
    end
    
    respond_with(@support_level)
  end
  
  def edit
    @support_level = SupportLevel.friendly.find(params[:id])
    respond_with(@support_level)
  end
  
  def update
    @support_level = SupportLevel.friendly.find(params[:id])
    
    if @support_level.update_attributes(support_level_params)
      # write an update message to the activity log
      @support_level.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated support level '" + @support_level.name + "'"
    else
      flash[:error] = "Could not update support level '" + @support_level.name + "'"
    end
    
    respond_with(@support_level)
  end
  
  def destroy
    @support_level = SupportLevel.friendly.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @support_level.create_activity :destroy, owner: current_user
    if @support_level.destroy
      flash[:info] = "Successfully deleted support level '" + @support_level.name + "'"
    else
      flash[:error] = "Could not delete support level '" + @support_level.name + "'"
    end
    
    respond_with(@support_level)
  end
  
  private
  
  # for sorting columns
  def sort_column
    SupportLevel.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def support_level_params
    params.require(:support_level).permit!
  end
end
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

class ConsolesController < ApplicationController
  respond_to :html, :xml, :json, :csv
  helper_method :sort_column, :sort_direction
  
  def index
    @consoles = Console.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@consoles)
  end
  
  def show
    @console = Console.friendly.find(params[:id])
    respond_with(@console)
  end
  
  def new
    @console = Console.new
    respond_with(@console)
  end
  
  def create
    @console = Console.new(console_params)
    
    if @console.save
      # write a create message to the activity log
      @console.create_activity :create, owner: current_user
      flash[:info] = "Successfully created console '" + @console.name + "'"
    else
      flash[:error] = "Could not create console '" + @console.name + "'"
    end
    
    respond_with(@console)
  end
  
  def edit
    @console = Console.friendly.find(params[:id])
    respond_with(@console)
  end
  
  def update
    @console = Console.friendly.find(params[:id])
    
    if @console.update_attributes(console_params)
      # write an update message to the activity log
      @console.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated console '" + @console.name + "'"
    else
      flash[:error] = "Could not update console '" + @console.name + "'"
    end
    
    respond_with(@console)
  end
  
  def destroy
    @console = Console.friendly.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @console.create_activity :destroy, owner: current_user
    if @console.destroy
      flash[:info] = "Successfully deleted console '" + @console.name + "'"
    else
      flash[:error] = "Could not delete console '" + @console.name + "'"
    end
    
    respond_with(@console)
  end
  
  def graph
  end
  
  private
  
  # for sorting columns
  def sort_column
    Console.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def console_params
    params.require(:console).permit!
  end
end
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

class PeopleController < ApplicationController
  respond_to :html, :xml, :json, :csv
  helper_method :sort_column, :sort_direction
  
  def index
    @people = Person.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@people)
  end
  
  def show
    @person = Person.friendly.find(params[:id])
    respond_with(@person)
  end
  
  def new
    @person = Person.new
    respond_with(@person)
  end
  
  def create
    @person = Person.new(person_params)
    
    if @person.save
      # write a create message to the activity log
      @person.create_activity :create, owner: current_user
      flash[:info] = "Successfully created person '" + @person.name + "'"
    else
      flash[:error] = "Could not create person '" + @person.name + "'"
    end
    
    respond_with(@person)
  end
  
  def edit
    @person = Person.friendly.find(params[:id])
    respond_with(@person)
  end
  
  def update
    @person = Person.friendly.find(params[:id])
    
    if @person.update_attributes(person_params)
      # write an update message to the activity log
      @person.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated person '" + @person.name + "'"
    else
      flash[:error] = "Could not update person '" + @person.name + "'"
    end
    
    respond_with(@person)
  end
  
  def destroy
    @person = Person.friendly.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @person.create_activity :destroy, owner: current_user
    if @person.destroy
      flash[:info] = "Successfully deleted person '" + @person.name + "'"
    else
      flash[:error] = "Could not delete person '" + @person.name + "'"
    end
    
    respond_with(@person)
  end
  
  def graph
  end
  
  private
  
  # for sorting columns
  def sort_column
    Person.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def person_params
    params.require(:person).permit!
  end
end
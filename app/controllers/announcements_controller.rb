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

class AnnouncementsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  # as per railscast 103
  def hide
    ids = [params[:id], *cookies.signed[:hidden_announcement_ids]]
    cookies.permanent.signed[:hidden_announcement_ids] = ids
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
  
  def index
    @announcements = Announcement.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@announcements)
  end
  
  def show
    @announcement = Announcement.find(params[:id])
    respond_with(@announcement)
  end
  
  def new
    @announcement = Announcement.new
    respond_with(@announcement)
  end
  
  def create
    @announcement = Announcement.new(announcement_params)
    
    if @announcement.save
      # write a create message to the activity log
      @announcement.create_activity :create, owner: current_user
      flash[:info] = "Successfully created announcement '" + @announcement.id.to_s + "'"
    else
      flash[:error] = "Could not create announcement '" + @announcement.id.to_s + "'"
    end
    
    respond_with(@announcement)
  end
  
  def edit
    @announcement = Announcement.find(params[:id])
    respond_with(@announcement)
  end
  
  def update
    @announcement = Announcement.find(params[:id])
    
    if @announcement.update_attributes(announcement_params)
      # write an update message to the activity log
      @announcement.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated announcement '" + @announcement.id.to_s + "'"
    else
      flash[:error] = "Could not update announcement '" + @announcement.id.to_s + "'"
    end
    
    respond_with(@announcement)
  end
  
  def destroy
    @announcement = Announcement.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @announcement.create_activity :destroy, owner: current_user
    if @announcement.destroy
      flash[:info] = "Successfully deleted announcement '" + @announcement.id.to_s + "'"
    else
      flash[:error] = "Could not delete announcement '" + @announcement.id.to_s + "'"
    end
    
    respond_with(@announcement)
  end
  
  private
  
  # for sorting columns
  def sort_column
    Announcement.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def announcement_params
    params.require(:announcement).permit(:ends_at, :message, :starts_at)
  end
end

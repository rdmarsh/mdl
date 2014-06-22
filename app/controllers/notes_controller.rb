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

class NotesController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :get_noteable
  
  def index
    @notes = @noteable.notes.order("created_at desc").page(params[:page])
    respond_with(@notes)
  end
  
  def new
    @note = @noteable.notes.new
    respond_with(@noteable)
  end
  
  def create
    @note = @noteable.notes.new(note_params)
    
    if @note.save
      # write a create message to the activity log
      @note.create_activity :create, owner: current_user
      flash[:info] = "Successfully added note"
      # redirect_to @noteable
      # redirect_to [@noteable, :notes]
    else
      flash[:error] = "Could not add note"  
    end
    respond_with(@noteable)
  end
  
  def destroy
    @note = @noteable.notes.find(note_params)
    
    @note.create_activity :create, owner: current_user
    
    @noteable = @note.noteable
      if @note.destroy
        respond_to do |format|
          format.html { redirect_to @noteable, notice: "Note deleted."  }
        end
      end
   end
  
  
  private
  
  def get_noteable
      @noteable = params[:noteable].classify.constantize.friendly.find(noteable_id)
  end

  def noteable_id
    params[(params[:noteable].singularize + "_id").to_sym]
  end
  
  
  def load_noteable
    klass = [Organisation, System].detect { |c| params["#{c.name.underscore}_id"]}
    @noteable = klass.find(params["#{klass.name.underscore}_id"])
  end
  
  def note_params
    params.require(:note).permit!
  end
end
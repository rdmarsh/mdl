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
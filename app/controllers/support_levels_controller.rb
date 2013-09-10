class SupportLevelsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @supportlevels = SupportLevel.order(sort_column + " " + sort_direction)
    respond_with(@supportlevels)
  end
  
  def show
    @supportlevel = SupportLevel.find(params[:id])
    respond_with(@supportlevel)
  end
  
  def new
    @supportlevel = SupportLevel.new
    respond_with(@supportlevel)
  end
  
  def create
    @supportlevel = SupportLevel.new(supportlevel_params)
    
    if @supportlevel.save
      flash[:notice] = "New support level '" + @supportlevel.name + "' created"
    else
      flash[:error] = "Could not create support level"
    end
    respond_with(@supportlevel)
  end
  
  def edit
    @supportlevel = SupportLevel.find(params[:id])
    respond_with(@supportlevel)
  end
  
  def update
    @supportlevel = SupportLevel.find(params[:id])
    
    if @supportlevel.update_attributes(supportlevel_params)
      flash[:notice] = "Successfully updated support level '" + @supportlevel.name + "'"
    else
      render 'edit'
    end
    respond_with(@supportlevel)
  end
  
  def destroy
    @supportlevel = SupportLevel.find(params[:id])
    if @supportlevel.destroy
      flash[:notice] = "Successfully deleted support level '" + @supportlevel.name + "'"
    else
      flash[:error] = "Could not delete support level '" + @supportlevel.name + "'"
    end
    respond_with(@supportlevel)
  end
  
  private
  
  # for sorting columns
  def sort_column
    SupportLevel.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def supportlevel_params
    params.require(:support_level).permit!
  end
end
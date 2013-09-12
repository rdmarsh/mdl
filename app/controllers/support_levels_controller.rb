class SupportLevelsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @support_levels = SupportLevel.order(sort_column + " " + sort_direction)
    respond_with(@support_levels)
  end
  
  def show
    @support_level = SupportLevel.find(params[:id])
    respond_with(@support_level)
  end
  
  def new
    @support_level = SupportLevel.new
    respond_with(@support_level)
  end
  
  def create
    @support_level = SupportLevel.new(support_level_params)
    
    if @support_level.save
      flash[:success] = "New support level '" + @support_level.name + "' created"
    else
      flash[:error] = "Could not create support level"
    end
    respond_with(@support_level)
  end
  
  def edit
    @support_level = SupportLevel.find(params[:id])
    respond_with(@support_level)
  end
  
  def update
    @support_level = SupportLevel.find(params[:id])
    
    if @support_level.update_attributes(support_level_params)
      flash[:success] = "Successfully updated support level '" + @support_level.name + "'"
    else
      render action: 'edit'
    end
    respond_with(@support_level)
  end
  
  def destroy
    @support_level = SupportLevel.find(params[:id])
    if @support_level.destroy
      flash[:success] = "Successfully deleted support level '" + @support_level.name + "'"
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
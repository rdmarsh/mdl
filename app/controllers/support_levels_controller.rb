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
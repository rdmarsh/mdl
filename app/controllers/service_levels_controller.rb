class ServiceLevelsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @service_levels = ServiceLevel.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@service_levels)
  end
  
  def show
    @service_level = ServiceLevel.find(params[:id])
    respond_with(@service_level)
  end
  
  def new
    @service_level = ServiceLevel.new
    respond_with(@service_level)
  end
  
  def create
    @service_level = ServiceLevel.new(service_level_params)
    
    if @service_level.save
      # write a create message to the activity log
      @service_level.create_activity :create
      flash[:info] = "Successfully created service level '" + @service_level.name + "'"
    else
      flash[:error] = "Could not create service level '" + @service_level.name + "'"
    end
    
    respond_with(@service_level)
  end
  
  def edit
    @service_level = ServiceLevel.find(params[:id])
    respond_with(@service_level)
  end
  
  def update
    @service_level = ServiceLevel.find(params[:id])
    
    if @service_level.update_attributes(service_level_params)
      # write an update message to the activity log
      @service_level.create_activity :update
      flash[:info] = "Successfully updated service level '" + @service_level.name + "'"
    else
      flash[:error] = "Could not update service level '" + @service_level.name + "'"
    end
    
    respond_with(@service_level)
  end
  
  def destroy
    @service_level = ServiceLevel.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @service_level.create_activity :destroy
    if @service_level.destroy
      flash[:info] = "Successfully deleted service level '" + @service_level.name + "'"
    else
      flash[:error] = "Could not delete service level '" + @service_level.name + "'"
    end
    
    respond_with(@service_level)
  end
  
  private
  
  # for sorting columns
  def sort_column
    ServiceLevel.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def service_level_params
    params.require(:service_level).permit!
  end
end
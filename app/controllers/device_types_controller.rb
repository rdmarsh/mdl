class DeviceTypesController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @device_types = DeviceType.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@device_types)
  end
  
  def show
    @device_type = DeviceType.find(params[:id])
    respond_with(@device_type)
  end
  
  def new
    @device_type = DeviceType.new
    respond_with(@device_type)
  end
  
  def create
    @device_type = DeviceType.new(device_type_params)
    
    if @device_type.save
      # write a create message to the activity log
      @device_type.create_activity :create, owner: current_user
      flash[:info] = "Successfully created device type '" + @device_type.name + "'"
    else
      flash[:error] = "Could not create device type '" + @device_type.name + "'"
    end
    
    respond_with(@device_type)
  end
  
  def edit
    @device_type = DeviceType.find(params[:id])
    respond_with(@device_type)
  end
  
  def update
    @device_type = DeviceType.find(params[:id])
    
    if @device_type.update_attributes(device_type_params)
      # write an update message to the activity log
      @device_type.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated device type '" + @device_type.name + "'"
    else
      flash[:error] = "Could not update device type '" + @device_type.name + "'"
    end
    
    respond_with(@device_type)
  end
  
  def destroy
    @device_type = DeviceType.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @device_type.create_activity :destroy, owner: current_user
    if @device_type.destroy
      flash[:info] = "Successfully deleted device type '" + @device_type.name + "'"
    else
      flash[:error] = "Could not delete device type '" + @device_type.name + "'"
    end
    
    respond_with(@device_type)
  end
  
  private
  
  # for sorting columns
  def sort_column
    DeviceType.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def device_type_params
    params.require(:device_type).permit!
  end
end
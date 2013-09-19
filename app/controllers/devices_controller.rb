class DevicesController < ApplicationController
  respond_to :html, :xml, :json, :csv
  helper_method :sort_column, :sort_direction
  
  def index
    @devices = Device.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@devices)
  end
  
  def show
    @device = Device.find(params[:id])
    respond_with(@device)
  end
  
  def new
    @device = Device.new
    respond_with(@device)
  end
  
  def create
    @device = Device.new(device_params)
    
    if @device.save
      # write a create message to the activity log
      @device.create_activity :create
      flash[:info] = "Successfully created device '" + @device.name + "'"
    else
      flash[:error] = "Could not create device '" + @device.name + "'"
    end
    
    respond_with(@device)
  end
  
  def edit
    @device = Device.find(params[:id])
    respond_with(@device)
  end
  
  def update
    @device = Device.find(params[:id])
    
    if @device.update_attributes(device_params)
      # write an update message to the activity log
      @device.create_activity :update
      flash[:info] = "Successfully updated device '" + @device.name + "'"
    else
      flash[:error] = "Could not update device '" + @device.name + "'"
    end

    respond_with(@device)
  end
  
  def destroy
    @device = Device.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @device.create_activity :destroy
    if @device.destroy
      flash[:info] = "Successfully deleted device '" + @device.name + "'"
    else
      flash[:error] = "Could not delete device '" + @device.name + "'"
    end
    
    respond_with(@device)
  end
  
  private
  
  # for sorting columns
  def sort_column
    Device.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def device_params
    params.require(:device).permit!
  end
end
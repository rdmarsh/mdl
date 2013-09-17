class DevicesController < ApplicationController
  respond_to :html, :xml, :json, :csv
  helper_method :sort_column, :sort_direction
  
  def index
    @devices = Device.order(sort_column + " " + sort_direction)
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
      flash[:info] = "Successfully updated device '" + @device.name + "'"
    else
      flash[:error] = "Could not update device '" + @device.name + "'"
    end
    respond_with(@device)
  end
  
  def destroy
    @device = Device.find(params[:id])
    
    # @device_type = @device.device_types.to_a
    if @device.destroy
      flash[:info] = "Successfully deleted device '" + @device.name + "'"
      # expect(device_types).not_to be_empty
      # device_types.each do |device_type|
        # expect(DeviceType.where(id: device_type.id)).to be_empty
      # end
      
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

class DeviceTypesController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @devicetypes = DeviceType.order(sort_column + " " + sort_direction)
    respond_with(@devicetypes)
  end
  
  def show
    @devicetype = DeviceType.find(params[:id])
    respond_with(@devicetype)
  end
  
  def new
    @devicetype = DeviceType.new
    respond_with(@devicetype)
  end
  
  def create
    @devicetype = DeviceType.new(device_type_params)
    
    if @devicetype.save
      flash[:notice] = "New device type '" + @devicetype.name + "' created"
    else
      flash[:error] = "Could not create device type"
    end
    respond_with(@devicetype)
  end
  
  def edit
    @devicetype = DeviceType.find(params[:id])
    respond_with(@devicetype)
  end
  
  def update
    @devicetype = DeviceType.find(params[:id])
    
    if @devicetype.update_attributes(device_type_params)
      flash[:notice] = "Successfully updated device type '" + @devicetype.name + "'"
    else
      render 'edit'
    end
    respond_with(@devicetype)
  end
  
  def destroy
    @devicetype = DeviceType.find(params[:id])
    if @devicetype.destroy
      flash[:notice] = "Successfully deleted device type '" + @devicetype.name + "'"
    else
      flash[:error] = "Could not delete device type '" + @devicetype.name + "'"
    end
    respond_with(@devicetype)
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
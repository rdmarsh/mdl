class DeviceModelsController < ApplicationController
  respond_to :html, :xml, :json, :csv
  helper_method :sort_column, :sort_direction
  
  def index
    @device_models = DeviceModel.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@device_models)
  end
  
  def show
    @device_model = DeviceModel.find(params[:id])
    respond_with(@device_model)
  end
  
  def new
    @device_model = DeviceModel.new
    respond_with(@device_model)
  end
  
  def create
    @device_model = DeviceModel.new(device_model_params)
    
    if @device_model.save
      flash[:info] = "Successfully created device model '" + @device_model.name + "'"
    else
      flash[:error] = "Could not create device model '" + @device_model.name + "'"
    end
    respond_with(@device_model)
  end
  
  def edit
    @device_model = DeviceModel.find(params[:id])
    respond_with(@device_model)
  end
  
  def update
    @device_model = DeviceModel.find(params[:id])
    
    if @device_model.update_attributes(device_model_params)
      flash[:info] = "Successfully updated device model '" + @device_model.name + "'"
    else
      flash[:error] = "Could not update device model '" + @device_model.name + "'"
    end
    respond_with(@device_model)
  end
  
  def destroy
    @device_model = DeviceModel.find(params[:id])
    
    # @device_type = @device_model.device_types.to_a
    if @device_model.destroy
      flash[:info] = "Successfully deleted device model '" + @device_model.name + "'"
      # expect(device_types).not_to be_empty
      # device_types.each do |device_type|
        # expect(DeviceType.where(id: device_type.id)).to be_empty
      # end
      
    else
      flash[:error] = "Could not delete device model '" + @device_model.name + "'"
    end
    respond_with(@device_model)
  end
  
  private
  
  # for sorting columns
  def sort_column
    DeviceModel.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def device_model_params
    params.require(:device_model).permit!
  end
end
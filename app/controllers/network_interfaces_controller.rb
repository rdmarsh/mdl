class NetworkInterfacesController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @network_interfaces = NetworkInterface.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@network_interfaces)
  end
  
  def show
    @network_interface = NetworkInterface.friendly.find(params[:id])
    respond_with(@network_interface)
  end
  
  def new
    @network_interface = NetworkInterface.new
    respond_with(@network_interface)
  end
  
  def create
    @network_interface = NetworkInterface.new(network_interface_params)
    
    if @network_interface.save
      # write a create message to the activity log
      @network_interface.create_activity :create, owner: current_user
      flash[:info] = "Successfully created network interface '" + @network_interface.name + "'"
    else
      flash[:error] = "Could not create network interface '" + @network_interface.name + "'"
    end
    
    respond_with(@network_interface)
  end
  
  def edit
    @network_interface = NetworkInterface.friendly.find(params[:id])
    respond_with(@network_interface)
  end
  
  def update
    @network_interface = NetworkInterface.friendly.find(params[:id])
    
    if @network_interface.update_attributes(network_interface_params)
      # write an update message to the activity log
      @network_interface.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated network interface '" + @network_interface.name + "'"
    else
      flash[:error] = "Could not update network interface '" + @network_interface.name + "'"
    end
    
    respond_with(@network_interface)
  end
  
  def destroy
    @network_interface = NetworkInterface.friendly.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @network_interface.create_activity :destroy, owner: current_user
    if @network_interface.destroy
      flash[:info] = "Successfully deleted network interface '" + @network_interface.name + "'"
    else
      flash[:error] = "Could not delete network interface '" + @network_interface.name + "'"
    end
    
    respond_with(@network_interface)
  end
  
  private
  
  # for sorting columns
  def sort_column
    NetworkInterface.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def network_interface_params
    params.require(:network_interface).permit!
  end
end

class AddressesController < ApplicationController
  respond_to :html, :xml, :json, :csv
  helper_method :sort_column, :sort_direction
  
  def index
    @addresses = Address.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@addresses)
  end
  
  def show
    @address = Address.friendly.find(params[:id])
    respond_with(@address)
  end
  
  def new
    @address = Address.new
    respond_with(@address)
  end
  
  def create
    @address = Address.new(address_params)
    
    if @address.save
      # write a create message to the activity log
      @address.create_activity :create, owner: current_user
      flash[:info] = "Successfully created address '" + @address.name + "'"
    else
      flash[:error] = "Could not create address '" + @address.name + "'"
    end
    
    respond_with(@address)
  end
  
  def edit
    @address = Address.friendly.find(params[:id])
    respond_with(@address)
  end
  
  def update
    @address = Address.friendly.find(params[:id])
    
    if @address.update_attributes(address_params)
      # write an update message to the activity log
      @address.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated address '" + @address.name + "'"
    else
      flash[:error] = "Could not update address '" + @address.name + "'"
    end
    
    respond_with(@address)
  end
  
  def destroy
    @address = Address.friendly.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @address.create_activity :destroy, owner: current_user
    if @address.destroy
      flash[:info] = "Successfully deleted address '" + @address.name + "'"
    else
      flash[:error] = "Could not delete address '" + @address.name + "'"
    end
    
    respond_with(@address)
  end
  
  def graph
  end
  
  private
  
  # for sorting columns
  def sort_column
    Address.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def address_params
    params.require(:address).permit!
  end
end
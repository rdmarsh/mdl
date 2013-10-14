class AddressesController < ApplicationController
  respond_to :html, :xml, :json, :csv
  helper_method :sort_column, :sort_direction
  
  def index
    @addresses = Address.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@addresses)
  end
  
  def show
    @address = Address.find(params[:id])
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
      flash[:info] = "Successfully created address '" + @address.id.to_s + "'"
    else
      flash[:error] = "Could not create address '" + @address.id.to_s + "'"
    end
    
    respond_with(@address)
  end
  
  def edit
    @address = Address.find(params[:id])
    respond_with(@address)
  end
  
  def update
    @address = Address.find(params[:id])
    
    if @address.update_attributes(address_params)
      # write an update message to the activity log
      @address.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated address '" + @address.id.to_s + "'"
    else
      flash[:error] = "Could not update address '" + @address.id.to_s + "'"
    end
    
    respond_with(@address)
  end
  
  def destroy
    @address = Address.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @address.create_activity :destroy, owner: current_user
    if @address.destroy
      flash[:info] = "Successfully deleted address '" + @address.id.to_s + "'"
    else
      flash[:error] = "Could not delete address '" + @address.id.to_s + "'"
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
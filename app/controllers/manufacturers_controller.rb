class ManufacturersController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @manufacturers = Manufacturer.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@manufacturers)
  end
  
  def show
    @manufacturer = Manufacturer.find(params[:id])
    respond_with(@manufacturer)
  end
  
  def new
    @manufacturer = Manufacturer.new
    respond_with(@manufacturer)
  end
  
  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    
    if @manufacturer.save
      flash[:info] = "Successfully created manufacturer '" + @manufacturer.name + "'"
    else
      flash[:error] = "Could not create manufacturer '" + @manufacturer.name + "'"
    end
    respond_with(@manufacturer)
  end
  
  def edit
    @manufacturer = Manufacturer.find(params[:id])
    respond_with(@manufacturer)
  end
  
  def update
    @manufacturer = Manufacturer.find(params[:id])
    
    if @manufacturer.update_attributes(manufacturer_params)
      flash[:info] = "Successfully updated manufacturer '" + @manufacturer.name + "'"
    else
      flash[:error] = "Could not update manufacturer '" + @manufacturer.name + "'"
    end
    respond_with(@manufacturer)
  end
  
  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    if @manufacturer.destroy
      flash[:info] = "Successfully deleted manufacturer '" + @manufacturer.name + "'"
    else
      flash[:error] = "Could not delete manufacturer '" + @manufacturer.name + "'"
    end
    respond_with(@manufacturer)
  end
  
  private
  
  # for sorting columns
  def sort_column
    Manufacturer.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def manufacturer_params
    params.require(:manufacturer).permit!
  end
end
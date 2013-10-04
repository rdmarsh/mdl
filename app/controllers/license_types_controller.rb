class LicenseTypesController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @license_types = LicenseType.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@license_types)
  end
  
  def show
    @license_type = LicenseType.friendly.find(params[:id])
    respond_with(@license_type)
  end
  
  def new
    @license_type = LicenseType.new
    respond_with(@license_type)
  end
  
  def create
    @license_type = LicenseType.new(license_type_params)
    
    if @license_type.save
      # write a create message to the activity log
      @license_type.create_activity :create, owner: current_user
      flash[:info] = "Successfully created license type '" + @license_type.name + "'"
    else
      flash[:error] = "Could not create license type '" + @license_type.name + "'"
    end
    
    respond_with(@license_type)
  end
  
  def edit
    @license_type = LicenseType.friendly.find(params[:id])
    respond_with(@license_type)
  end
  
  def update
    @license_type = LicenseType.friendly.find(params[:id])
    
    if @license_type.update_attributes(license_type_params)
      # write an update message to the activity log
      @license_type.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated license type '" + @license_type.name + "'"
    else
      flash[:error] = "Could not update license type '" + @license_type.name + "'"
    end
    
    respond_with(@license_type)
  end
  
  def destroy
    @license_type = LicenseType.friendly.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @license_type.create_activity :destroy, owner: current_user
    if @license_type.destroy
      flash[:info] = "Successfully deleted license type '" + @license_type.name + "'"
    else
      flash[:error] = "Could not delete license type '" + @license_type.name + "'"
    end
    
    respond_with(@license_type)
  end
  
  private
  
  # for sorting columns
  def sort_column
    LicenseType.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def license_type_params
    params.require(:license_type).permit!
  end
end

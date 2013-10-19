class LicenseTypesController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    if params[:organisation_id]
      @organisation = Organisation.friendly.find(params[:organisation_id]) 
      @license_types = @organisation.license_types.page(params[:page])
    else
      @license_types = LicenseType.order(sort_column + " " + sort_direction).page(params[:page])
    end
  end
  
  def show
    if params[:organisation_id]
      @license_type = Organisation.friendly.find(params[:organisation_id]).license_types.page(params[:page])
    else
      @license_type = LicenseType.friendly.find(params[:id])
    end
  end
  
  def new
    @organisation = Organisation.friendly.find(params[:organisation_id])
    @license_type = @organisation.license_types.new
  end
  
  def create
    @organisation = Organisation.friendly.find(params[:organisation_id])
    @license_type = @organisation.new(license_type_params)
    
    if @license_type.save
      # write a create message to the activity log
      @license_type.create_activity :create, owner: current_user
      flash.now[:info] = "Successfully created license type '" + @license_type.name + "'"
    else
      flash.now[:error] = "Could not create license type '" + @license_type.name + "'"
      render 'new'
    end
  end
  
  def edit
    @license_type = LicenseType.friendly.find(params[:id])
  end
  
  def update
    @license_type = LicenseType.friendly.find(params[:id])
    
    if @license_type.update_attributes(license_type_params)
      # write an update message to the activity log
      @license_type.create_activity :update, owner: current_user
      flash.now[:info] = "Successfully updated license type '" + @license_type.name + "'"
    else
      flash.now[:error] = "Could not update license type '" + @license_type.name + "'"
      render 'edit'
    end
  end
  
  def destroy
    @license_type = LicenseType.friendly.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @license_type.create_activity :destroy, owner: current_user
    if @license_type.destroy
      flash.now[:info] = "Successfully deleted license type '" + @license_type.name + "'"
    else
      flash.now[:error] = "Could not delete license type '" + @license_type.name + "'"
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

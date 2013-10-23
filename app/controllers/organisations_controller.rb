class OrganisationsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  # before_action :load_address
  
  def index
    @organisations = Organisation.order(sort_column + " " + sort_direction).page(params[:page])
  end
  
  def show
    @organisation = Organisation.friendly.find(params[:id])
  end
  
  def new
    @organisation = Organisation.new
  end
  
  def create
    @organisation = Organisation.new(organisation_params)
    
    if @organisation.save
      # write a create message to the activity log
      @organisation.create_activity :create, owner: current_user
      flash[:info] = "Successfully created organisation '" + @organisation.name + "'"
    else
      flash[:error] = "Could not create organisation '" + @organisation.name + "'"
    end
  end
  
  def edit
    @organisation = Organisation.friendly.find(params[:id])
  end
  
  def update
    @organisation = Organisation.friendly.find(params[:id])
    
    if @organisation.update_attributes(organisation_params)
      # write an update message to the activity log
      @organisation.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated organisation '" + @organisation.name + "'"
    else
      flash[:error] = "Could not update organisation '" + @organisation.name + "'"
    end
  end
  
  def destroy
    @organisation = Organisation.friendly.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @organisation.create_activity :destroy, owner: current_user
    if @organisation.destroy
      flash[:info] = "Successfully deleted organisation '" + @organisation.name + "'"
    else
      flash[:error] = "Could not delete organisation '" + @organisation.name + "'"
    end
  end
  
  private

  def sort_column
    Organisation.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def organisation_params
    params.require(:organisation).permit!
  end
end
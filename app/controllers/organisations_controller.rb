class OrganisationsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @organisations = Organisation.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@organisations)
  end
  
  def show
    @organisation = Organisation.find(params[:id])
    respond_with(@organisation)
  end
  
  def new
    @organisation = Organisation.new
    respond_with(@organisation)
  end
  
  def create
    @organisation = Organisation.new(organisation_params)
    
    if @organisation.save
      flash[:info] = "Successfully created organisation '" + @organisation.name + "'"
    else
      flash[:error] = "Could not create organisation '" + @organisation.name + "'"
    end
    respond_with(@organisation)
  end
  
  def edit
    @organisation = Organisation.find(params[:id])
    respond_with(@organisation)
  end
  
  def update
    @organisation = Organisation.find(params[:id])
    
    if @organisation.update_attributes(organisation_params)
      flash[:info] = "Successfully updated organisation '" + @organisation.name + "'"
    else
      flash[:error] = "Could not update organisation '" + @organisation.name + "'"
    end
    respond_with(@organisation)
  end
  
  def destroy
    @organisation = Organisation.find(params[:id])
    if @organisation.destroy
      flash[:info] = "Successfully deleted organisation '" + @organisation.name + "'"
    else
      flash[:error] = "Could not delete organisation '" + @organisation.name + "'"
    end
    respond_with(@organisation)
  end
  
  private
  
  # for sorting columns
  def sort_column
    Organisation.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def organisation_params
    params.require(:organisation).permit!
  end
end
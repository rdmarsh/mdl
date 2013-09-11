class OrganisationsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @organisations = Organisation.order(sort_column + " " + sort_direction)
    respond_with(@organisations)
  end
  
  def show
    @organisation = Organisation.find(params[:id])
    respond_with(@organisations)
  end
  
  def new
    @organisation = Organisation.new
    respond_with(@organisations)
  end
  
  def create
    @organisation = Organisation.new(organisation_params)
    
    if @organisation.save
      flash[:notice] = "New organisation '" + @organisation.name + "' created"
    else
      flash[:error] = "Could not create organisation"
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
      flash[:notice] = "Successfully updated organisation '" + @organisation.name + "'"
    else
      render action: 'edit';
    end
    respond_with(@organisation)
  end
  
  def destroy
    @organisation = Organisation.find(params[:id])
    if @organisation.destroy
      flash[:notice] = "Successfully deleted organisation '" + @organisation.name + "'"
    else
      flash[:error] = "Could not delete organisation '" + @organisation.name + "'"
    end
    respond_with(@organisation)
  end
  
  private
  
  # for sorting columns
  def sort_column
    Organisation.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  # for allowing editing on fields
  def organisation_params
    params.require(:organisation).permit!
  end
end
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
      flash[:notice] = "New organisation created!"
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
      flash[:notice] = "Successfully updated organisation"
    else
      render 'edit'
    end
    respond_with(@organisation)
  end
  
  def destroy
    @organisation = Organisation.find(params[:id])
    @organisation.destroy
    flash[:notice] = "Successfully deleted organisation"
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
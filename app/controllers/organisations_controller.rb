class OrganisationsController < ApplicationController
  respond_to :html, :xml, :json


  helper_method :sort_column, :sort_direction
  
  def index
    @organisations = Organisation.order(sort_column + " " + sort_direction)
  end

  def show

    @organisation = Organisation.find(params[:id])
  end

  def new

    @organisation = Organisation.new
  end

  def create
    
    @organisation = Organisation.new(organisation_params)
    
    if @organisation.save
      redirect_to organisations_url, notice: "New organisation created"
    else
      render "new"
    end
  end
  
  def edit
    
    @organisation = Organisation.find(params[:id])
  end
  
  def update
    
    @organisation = Organisation.find(params[:id])
    
    if @organisation.update_attributes(organisation_params)
      redirect_to organisations_url, notice: "Successfully updated organisation"
    else
      render 'edit'
    end
  end
  
  def destroy
    @organisation = Organisation.find(params[:id])
    @organisation.destroy
    redirect_to organisations_url, notice: "Successfully destroyed organisation"
  end
  
  private

  def organisation_params
    params.require(:organisation).permit!
  end
  
end
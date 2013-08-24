class OrganisationsController < ApplicationController
  def index
    @search = Organisation.search(params[:q])
    @organisations = @search.result
  end

  def show
    @organisation = Organisation.find(params[:id])
  end

  def new
  end

  def create
  end
  
  def edit
    @organisation = Organisation.find(params[:id])
  end
  
  def update
    @organisation = Organisation.find(params[:id])
    if @organisation.update_attributes(organisation_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
    else
      render 'edit'
    end
  end
  
  def destroy
  end
end
class OrganisationsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @organisations = Organisation.order(sort_column + " " + sort_direction)
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
  
  private
  
  def sort_column
    Organisation.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end
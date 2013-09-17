class RelationshipsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @relationships = Relationship.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@relationships)
  end
  
  def show
    @relationship = Relationship.find(params[:id])
    respond_with(@relationship)
  end
  
  def new
    @relationship = Relationship.new
    respond_with(@relationship)
  end
  
  def create
    @relationship = Relationship.new(relationship_params)
    
    if @relationship.save
      flash[:info] = "Successfully created relationship '" + @relationship.name + "'"
    else
      flash[:error] = "Could not create relationship '" + @relationship.name + "'" 
    end
    respond_with(@relationship)
  end
  
  def edit
    @relationship = Relationship.find(params[:id])
    respond_with(@relationship)
  end
    
  def update
    @relationship = Relationship.find(params[:id])
    
    if @relationship.update_attributes(relationship_params)
      flash[:info] = "Successfully updated relationship '" + @relationship.name + "'"
    else
      flash[:error] = "Could not update relationship '" + @relationship.name + "'"
    end
    respond_with(@relationship)
  end
  
  def destroy
    @relationship = Relationship.find(params[:id])
    if @relationship.destroy
      flash[:info] = "Successfully deleted relationship '" + @relationship.name + "'"
    else
      flash[:error] = "Could not delete relationship '" + @relationship.name + "'"
    end
    respond_with(@relationship)
  end
  
  private
  
  # for sorting columns
  def sort_column
    Relationship.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def relationship_params
    params.require(:relationship).permit!
  end
end

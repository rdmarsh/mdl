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
      # write a create message to the activity log
      @relationship.create_activity :create
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
      # write an update message to the activity log
      @relationship.create_activity :update
      flash[:info] = "Successfully updated relationship '" + @relationship.name + "'"
    else
      flash[:error] = "Could not update relationship '" + @relationship.name + "'"
    end
    
    respond_with(@relationship)
  end
  
  def destroy
    @relationship = Relationship.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @relationship.create_activity :destroy
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
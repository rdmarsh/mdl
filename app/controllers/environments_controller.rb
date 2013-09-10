class EnvironmentsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @environments = Environment.order(sort_column + " " + sort_direction)
    respond_with(@environments)
  end
  
  def show
    @environment = Environment.find(params[:id])
    respond_with(@environment)
  end
  
  def new
    @environment = Environment.new
    respond_with(@environment)
  end
  
  def create
    @environment = Environment.new(environment_params)
    
    if @environment.save
      flash[:notice] = "New environment created!"
    end
    respond_with(@environment)
  end
  
  def edit
    @environment = Environment.find(params[:id])
    respond_with(@environment)
  end
  
  def update
    @environment = Environment.find(params[:id])
    
    if @environment.update_attributes(environment_params)
      flash[:notice] = "Successfully updated environment"
    else
      render 'edit'
    end
    respond_with(@environment)
  end
  
  def destroy
    @environment = Environment.find(params[:id])
    @environment.destroy
    flash[:notice] = "Successfully deleted environment"
    respond_with(@environment)
  end
  
  private
  
  # for sorting columns
  def sort_column
    Environment.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def environment_params
    params.require(:environment).permit!
  end
end
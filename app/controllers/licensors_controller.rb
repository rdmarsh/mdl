class LicensorsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction
  
  def index
    @licensors = Licensor.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@licensors)
  end
  
  def show
    @licensor = Licensor.find(params[:id])
    respond_with(@licensor)
  end
  
  def new
    @licensor = Licensor.new
    respond_with(@licensor)
  end
  
  def create
    @licensor = Licensor.new(licensor_params)
    
    if @licensor.save
      # write a create message to the activity log
      @licensor.create_activity :create, owner: current_user
      flash[:info] = "Successfully added licensor"
    else
      flash[:error] = "Could not add licensor"
    end
    
    respond_with(@licensor)
  end
  
  def edit
    @licensor = Licensor.find(params[:id])
    respond_with(@licensor)
  end
  
  def update
    @licensor = Licensor.find(params[:id])
    
    if @licensor.update_attributes(licensor_params)
      # write an update message to the activity log
      @licensor.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated licensor"
    else
      flash[:error] = "Could not update licensor"
    end
    
    respond_with(@licensor)
  end
  
  def destroy
    @licensor = Licensor.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @licensor.create_activity :destroy, owner: current_user
    if @licensor.destroy
      flash[:info] = "Successfully deleted licensor '" + @licensor.name + "'"
    else
      flash[:error] = "Could not delete licensor '" + @licensor.name + "'"
    end
    
    respond_with(@licensor)
  end
  
  private
  
  # for sorting columns
  def sort_column
    Licensor.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def licensor_params
    params.require(:licensor).permit!
  end
end

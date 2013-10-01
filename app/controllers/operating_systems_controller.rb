class OperatingSystemsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction

  def index
    @operating_system_families = [
      "Unix",
      "Linux",
      "Windows",
      "Other",
      "Unknown",
      "None"
    ]
    
    @operating_systems = OperatingSystem.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@operating_systems)
  end

  def show
    @operating_system = OperatingSystem.find(params[:id])
    respond_with(@operating_system)
  end

  def new
    @operating_system = OperatingSystem.new
    respond_with(@operating_system)
  end

  def create
    @operating_system = OperatingSystem.new(operating_system_params)
  
    if @operating_system.save
      # write a create message to the activity log
      @operating_system.create_activity :create, owner: current_user
      flash[:info] = "Successfully created OperatingSystem '" + @operating_system.name + "'"
    else
      flash[:error] = "Could not create OperatingSystem '" + @operating_system.name + "'"
    end
  
    respond_with(@operating_system)
  end

  def edit
    @operating_system = OperatingSystem.find(params[:id])
    respond_with(@operating_system)
  end

  def update
    @operating_system = OperatingSystem.find(params[:id])
  
    if @operating_system.update_attributes(operating_system_params)
      # write an update message to the activity log
      @operating_system.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated OperatingSystem '" + @operating_system.name + "'"
    else
      flash[:error] = "Could not update OperatingSystem '" + @operating_system.name + "'"
    end
  
    respond_with(@operating_system)
  end

  def destroy
    @operating_system = OperatingSystem.find(params[:id])
  
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @operating_system.create_activity :destroy, owner: current_user
    if @operating_system.destroy
      flash[:info] = "Successfully deleted OperatingSystem '" + @operating_system.name + "'"
    else
      flash[:error] = "Could not delete OperatingSystem '" + @operating_system.name + "'"
    end
  
    respond_with(@operating_system)
  end

  private

  # for sorting columns
  def sort_column
    OperatingSystem.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  # for allowing editing on fields
  def operating_system_params
    params.require(:operating_system).permit!
  end
  end
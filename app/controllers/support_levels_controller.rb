class SupportLevelsController < ApplicationController
  
  def index
    @supportlevels = SupportLevel.order("name")
    respond_with(@supportlevels)
  end

  def show
    @supportlevel = SupportLevel.find(params[:id])
    respond_with(@supportlevel)
  end
  
  def new
    @supportlevel = SupportLevel.new
    respond_with(@supportlevel)
  end
  
  def create
    @supportlevel = SupportLevel.new(supportlevel_params) 
    
    if @supportlevel.save
      flash[:notice] = "New support level created!"
    end
    respond_with(@supportlevel)
  end
  
  def edit
    @supportlevel = SupportLevel.find(params[:id])
    respond_with(@supportlevel)
  end
  
  def update
    @supportlevel = SupportLevel.find(params[:id])
    
    if @supportlevel.update_attributes(supportlevel_params) 
      flash[:notice] = "Successfully updated support level"
    end
    respond_with(@supportlevel)
  end
  
  def destroy
    @supportlevel = SupportLevel.find(params[:id])
    @supportlevel.destroy
    flash[:notice] = "Successfully destroyed support level"
    respond_with(@supportlevel)
  end

  private

  def supportlevel_params
    params.require(:support_level).permit!
  end
  
  def sort_column
    SupportLevel.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  
end

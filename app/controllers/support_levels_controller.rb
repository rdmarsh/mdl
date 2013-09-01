class SupportLevelsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @supportlevels = SupportLevel.order("level")
  end

  def show
    @supportlevel = SupportLevel.find(params[:id])
  end
  
  def new
    @supportlevel = SupportLevel.new
  end
  
  def create
    @supportlevel = SupportLevel.new(supportlevel_params) 
     
    if @supportlevel.save
      redirect_to @supportlevel, notice: "New support level created!"
    else
      render "new"
    end
  end
  
  def edit
    @supportlevel = SupportLevel.find(params[:id])
  end
  
  def update
    @supportlevel = SupportLevel.find(params[:id])
    
    if @supportlevel.update_attributes(supportlevel_params) 
      redirect_to @supportlevel, notice: "Successfully updated support level."
    else
      render "edit"
    end
  end
  
  def destroy
    @supportlevel = Product.find(params[:id])
    @supportlevel.destroy
    redirect_to supportlevels_url, notice: "Successfully destroyed support level."
  end  

  private

  def supportlevel_params
    params.require(:supportlevel).permit!
  end
  
end

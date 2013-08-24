class SupportlevelsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @supportlevels = Supportlevel.all
  end

  def show
    @supportlevel = Supportlevel.find(params[:id])
  end
  
  def edit
    @supportlevel = Supportlevel.find(params[:id])
  end
  
end

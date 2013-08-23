class SupportlevelsController < ApplicationController
  def index
    @supportlevels = Supportlevel.all
  end

  def show
    @supportlevels = Supportlevel.find(params[:id])
  end
  
  def edit
    @supportlevels = Supportlevel.find(params[:id])
  end
  
end

class SupportlevelsController < ApplicationController
  def index
    @search = Supportlevel.search(params[:q])
    @supportlevels = @search.result
  end

  def show
    @supportlevel = Supportlevel.find(params[:id])
  end
  
  def edit
    @supportlevel = Supportlevel.find(params[:id])
  end
  
end

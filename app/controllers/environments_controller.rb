class EnvironmentsController < ApplicationController
  def index
    @search = Environment.search(params[:q])
    @environments = @search.result
    
  end
  
  def show
    @environment = Environment.find(params[:id])
  end
  
  def edit
    @environment = Environment.find(params[:id])
  end
end

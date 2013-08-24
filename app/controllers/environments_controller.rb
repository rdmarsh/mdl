class EnvironmentsController < ApplicationController
  def index
    @environments = Environment.all
  end
  
  def show
    @environment = Environment.find(params[:id])
  end
  
  def edit
    @environment = Environment.find(params[:id])
  end
end

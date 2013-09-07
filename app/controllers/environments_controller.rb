class EnvironmentsController < ApplicationController
  
  def index
    @environments = Environment.order("environment")
  end
  
  def show
    @environment = Environment.find(params[:id])
  end
  
  def edit
    @environment = Environment.find(params[:id])
  end
  
  private
  
  def sort_column
    Environment.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
end

class EnvironmentsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @environments = Environment.order(sort_column + " " + sort_direction)
  end
  
  def show
    @environment = Environment.find(params[:id])
  end
  
  def edit
    @environment = Environment.find(params[:id])
  end
end

class EnvironmentsController < ApplicationController
  def index
    @environments = Environment.all
  end
  def edit
    @environments = Environment.find(params[:id])
  end
end

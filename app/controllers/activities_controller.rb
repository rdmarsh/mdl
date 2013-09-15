class ActivitiesController < ApplicationController
  include PublicActivity::StoreController
  respond_to :html, :xml, :json
  
  def index
    @activities = PublicActivity::Activity.order("created_at desc")
    respond_with(@activities)
  end
  
  private
  
  # for sorting columns
  def sort_column
    PublicActivity.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
end

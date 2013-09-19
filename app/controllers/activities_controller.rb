class ActivitiesController < ApplicationController
  include PublicActivity::StoreController
  respond_to :html, :xml, :json
  
  def index
    @activities = PublicActivity::Activity.order("created_at desc").page(params[:page])
    if params[:all]
      @activities = @activities.per_page(Activities.count)
    end
    respond_with(@activities)
  end
end

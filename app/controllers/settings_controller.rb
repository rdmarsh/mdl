class SettingsController < ApplicationController
  respond_to :html, :xml, :json
  
  def show
    @settings = Settings.find(1)
    respond_with(@settings)
  end

  def edit
    @settings = Settings.find(1)
    respond_with(@settings)
  end
end

class OnemdlSettingsController < ApplicationController
  def show
    @onemdlsettings = OnemdlSettings.find(1)
  end

  def edit
    @onemdlsetting = OnemdlSettings.find(1)    
  end
end

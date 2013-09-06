class OnemdlSettingsController < ApplicationController
  def show
    @onemdlsettings = OnemdlSettings.find(1)
  end

  def edit
    @onemdlsettings = OnemdlSettings.find(1)    
  end
end

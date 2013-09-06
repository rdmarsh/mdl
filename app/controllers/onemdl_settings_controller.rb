class OnemdlSettingsController < ApplicationController
  def index
    @onemdlsettings = OnemdlSetting.find(1)
  end

  def edit
    @onemdlsetting = OnemdlSetting.find(1)
  end
  
  def update
    @onemdlsetting = OnemdlSetting.find(1)
    
    if @onemdlsetting.update_attributes(onemdlsetting_params) 
      flash[:notice] = "Successfully updated OnMDL Settings"
    end
    respond_with(@onemdlsetting)
  end
  
end

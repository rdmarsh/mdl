class OnemdlSettingsController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @onemdlsettings = OnemdlSetting.find(1)
    respond_with(@onemdlsettings)
  end

  def edit
    @onemdlsetting = OnemdlSetting.find(1)
    respond_with(@onemdlsetting)
  end
  
  def update
    @onemdlsetting = OnemdlSetting.find(1)
    
    if @onemdlsetting.update_attributes(onemdlsetting_params) 
      flash[:info] = "Successfully updated OnMDL Settings"
    end
    respond_with(@onemdlsetting)
  end
  
end

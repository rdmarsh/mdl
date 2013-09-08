class OnemdlSettingsController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @onemdlsettings = OnemdlSetting.find(1)
  end

  def edit
    @onemdlsetting = OnemdlSetting.(params[:id])
  end
  
  def update
    @onemdlsetting = OnemdlSetting.(params[:id])
    
    if @onemdlsetting.update_attributes(onemdlsetting_params) 
      flash[:notice] = "Successfully updated OnMDL Settings"
    end
    respond_with(@onemdlsetting)
  end
  
end

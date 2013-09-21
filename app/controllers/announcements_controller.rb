class AnnouncementsController < ActionController::Base
  # as per railscast 103
  def hide
    ids = [params[:id], *cookies.signed[:hidden_announcement_ids]]
    cookies.permanent.signed[:hidden_announcement_ids] = ids
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
  
  private
  
  # for allowing editing on fields
  def announcement_params
    params.require(:announcement).permit(:ends_at, :message, :starts_at)
  end
  
end

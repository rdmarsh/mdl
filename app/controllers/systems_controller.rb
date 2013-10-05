class SystemsController < InheritedResources::Base
  respond_to :html, :xml, :json, :csv
  
  belongs_to :organisation, :optional => true
  
  protected
  
  def collection
    @systems ||= end_of_association_chain.page(params[:page])
  end
end
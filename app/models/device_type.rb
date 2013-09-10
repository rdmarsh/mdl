class DeviceType < ActiveRecord::Base
  validates :name, presence: true
  
  before_destroy :protect_unknown
  
  private
  
  def protect_unknown
    !name.eql?("Unknown")
  end
end

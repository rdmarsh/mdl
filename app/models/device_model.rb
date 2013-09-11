class DeviceModel < ActiveRecord::Base
  belongs_to :device_type
  
  validates :name, presence: true
  
  before_destroy :protect_unknown
  
  def protect_unknown
    !name.downcase.eql?("unknown")
  end
end

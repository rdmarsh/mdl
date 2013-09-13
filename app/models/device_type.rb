class DeviceType < ActiveRecord::Base
  has_many :device_models
  validates_associated :device_models
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  
  # before_save { self.name = name.downcase }
  # validates_uniqueness_of :name, 
  
  before_destroy :protect_unknown
  
  private
  
  def protect_unknown
    !name.downcase.eql?("unknown")
  end
end

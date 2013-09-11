class Manufacturer < ActiveRecord::Base
  has_many :device_models
  
  validates :name, presence: true
  
  before_destroy :protect_unknown
  
  def protect_unknown
    !name.downcase.eql?("unknown")
  end
end

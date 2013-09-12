class ServiceLevel < ActiveRecord::Base
  has_many :organisations
  
  validates :name, presence: true
  
  # before_save { self.name = name.downcase }
  
  before_destroy :protect_unknown
  
  private
  
  def protect_unknown
    !name.downcase.eql?("unknown")
  end
end
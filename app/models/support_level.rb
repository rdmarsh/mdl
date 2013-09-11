class SupportLevel < ActiveRecord::Base
  has_many :organisations
  
  validates :name, presence: true
  validates :hours, presence: true
  validates :days, presence: true
  
  # before_save { self.name = name.downcase }
  
  before_destroy :protect_unknown
  
  private
  
  def protect_unknown
    !name.downcase.eql?("unknown")
  end
end
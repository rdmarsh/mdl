class SupportLevel < ActiveRecord::Base
  has_many :organisations
  
  validates :name, presence: true
  validates :hours, presence: true
  validates :days, presence: true
  
  before_save { self.name = name.humanize }
  
  before_destroy :protect_unknown
  
  private
  
  def protect_unknown
    !name.eql?("Unknown")
  end
end
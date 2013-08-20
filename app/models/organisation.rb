class Organisation < ActiveRecord::Base
  before_save { self.reference = reference.downcase }
  validates :reference, presence: true
  validates :name, presence: true
  
#  belongs_to :support_level
#  validates :support_level, presence: true
  
end

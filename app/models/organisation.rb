class Organisation < ActiveRecord::Base
  before_save { self.reference = reference.downcase }
  
  validates :reference, presence: true
  validates :name, presence: true
  validates :supportlevel, presence: true
  
  has_one :support_level, :class_name => 'SupportLevel'

  
end

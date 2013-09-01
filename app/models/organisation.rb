class Organisation < ActiveRecord::Base
  before_save { self.reference = reference.downcase }
  
  validates_format_of :reference, :with => /\A[-a-z]+\z/, :message => "can only contain letters and numbers."
  
  validates :reference, presence: true
  validates :name, presence: true
  validates :supportlevel, presence: true
  
  has_one :support_level, :class_name => 'SupportLevel'

  
end

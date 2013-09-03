class SupportLevel < ActiveRecord::Base
  has_many :organisations
  
  validates_presence_of :support_reference
  validates_presence_of :hours
  validates_presence_of :days
end
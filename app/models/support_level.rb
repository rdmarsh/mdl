class SupportLevel < ActiveRecord::Base
  has_many :organisations
  
  
  validates_presence_of :level
  validates_presence_of :hours
  validates_presence_of :days
end
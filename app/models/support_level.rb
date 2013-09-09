class SupportLevel < ActiveRecord::Base
  has_many :organisations
  
  before_save { self.name = name.humanize }
  
  validates_presence_of :name
  validates_presence_of :hours
  validates_presence_of :days
end
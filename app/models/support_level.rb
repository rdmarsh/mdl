class SupportLevel < ActiveRecord::Base
  has_many :organisations
  
  before_save { self.name = name.humanize }
  
  validates :name, presence: true
  validates :hours, presence: true
  validates :days, presence: true
end
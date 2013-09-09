class Environment < ActiveRecord::Base
  # has_many :organisations
  
  validates_presence_of :name
end

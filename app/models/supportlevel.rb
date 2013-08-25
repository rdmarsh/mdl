class Supportlevel < ActiveRecord::Base
  has_many :organisations
  
  validates_presence_of :supportlevel
  validates_presence_of :supporthours
  validates_presence_of :supportdays
end
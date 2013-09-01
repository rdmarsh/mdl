class Organisation < ActiveRecord::Base
  before_save { self.reference = reference.downcase }
  
  validates :reference, presence: true
  validates :name, presence: true
  validates :supportlevel, presence: true
  
  belongs_to :supportlevel
  belongs_to :environment 
end

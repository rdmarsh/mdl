class Organisation < ActiveRecord::Base
  before_save { self.reference = reference.downcase }
  validates :reference, presence: true
  validates :name, presence: true
  
  belongs_to :supportlevel
#  validates :supportlevel, presence: true

  belongs_to :environment  
end

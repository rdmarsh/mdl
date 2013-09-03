class Organisation < ActiveRecord::Base
  belongs_to :support_level
  
  
  
  before_save { self.reference = reference.downcase }
  
  validates_format_of :reference, :with => /\A[a-zA-Z\d]+\z/, :message => "Can only contain letters and numbers."
  
  validates :reference, presence: true
  validates :name, presence: true
  validates :support_level_id, presence: true
  

  
end

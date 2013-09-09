class Organisation < ActiveRecord::Base
  belongs_to :support_level
  
  before_save { self.name = name.downcase }
  before_save { self.email = email.downcase }
  
  validates_format_of :name, :with => /\A[a-zA-Z\d]+\z/, :message => "Can only contain letters and numbers."
  
  validates :name, presence: true
  validates :full_name, presence: true
  validates :support_level_id, presence: true
  
end

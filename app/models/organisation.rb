class Organisation < ActiveRecord::Base
  belongs_to :support_level
  belongs_to :service_level
  belongs_to :relationship
  
  validates_format_of :name, :with => /\A[a-zA-Z\d]+\z/, :message => "Can only contain letters and numbers."
  
  validates :name, presence: true
  validates :full_name, presence: true
  validates :support_level_id, presence: true
  validates :service_level_id, presence: true
  validates :relationship_id, presence: true
  
  # before_save { self.name = name.downcase }
  
  before_destroy :protect_unknown
  
  private
  
  def protect_unknown
    !name.downcase.eql?("unknown")
  end
end

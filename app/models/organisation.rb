class Organisation < ActiveRecord::Base
  include PublicActivity::Model
  tracked
  
  before_validation :strip_blanks
  
  belongs_to :support_level
  belongs_to :service_level
  belongs_to :relationship
  
  has_many :devices
  
  # validations
  validates_format_of :name, :with => /\A[a-zA-Z\d]+\z/, :message => "Can only contain letters and numbers."
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :full_name, presence: true
  validates :support_level_id, presence: true
  validates :service_level_id, presence: true
  validates :relationship_id, presence: true
  
  before_destroy :protect_unknown_none
  
  private
  
  def protect_unknown_none
    !name.downcase.eql?("unknown") and !name.downcase.eql?("none")
  end
  
  protected
  
  def strip_blanks
    self.name = self.name.strip
  end
  
end

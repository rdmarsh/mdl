class Organisation < ActiveRecord::Base
  include PublicActivity::Common
  
  before_validation :strip_blanks
  
  # belongs to
  belongs_to :relationship
  
  
  
  
  
  # has many
  has_many :devices, dependent: :restrict_with_error
  
  # validations
  validates_format_of :name, :with => /\A[a-zA-Z\d]+\z/, :message => "Can only contain letters and numbers."
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :full_name, presence: true
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

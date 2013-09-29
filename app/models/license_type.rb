class LicenseType < ActiveRecord::Base
  include PublicActivity::Common
  
  before_validation :strip_blanks
  
  # belongs to
  belongs_to :organisation
  
  
  
  
  
  # has many
  has_many :licenses, dependent: :restrict_with_error
  
  # validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :organisation, presence: true
  
  
  
  
  
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

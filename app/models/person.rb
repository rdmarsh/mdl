class Person < ActiveRecord::Base
  include PublicActivity::Common
  
  # friendly IDs, better URLs
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  # regenerate new slugs?
  def should_generate_new_friendly_id?
    name_changed?
  end
  
  
  
  
  
  
  
  
  
  
  before_validation :strip_blanks
  
  # belongs to
  belongs_to :organisation
  
  
  
  
  
  
  
  
  # validations
  validates :name, presence: true
  validates :organisation_id, presence: true
  
  
  
  
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

class DeviceModel < ActiveRecord::Base
  include PublicActivity::Common
  
  # friendly IDs, better URLs
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  # regenerate new slugs?
  def should_generate_new_friendly_id?
    name_changed?
  end
  
  # Try building a slug based on the following fields in
  # increasing order of specificity.
  # def slug_candidates
  #   [
  #     :name,
  #     [:name, :organisation_id]
  #   ]
  # end
  
  before_validation :strip_blanks
  
  # belongs to
  belongs_to :device_type
  belongs_to :manufacturer
  
  
  
  
  # has many
  has_many :systems, dependent: :restrict_with_error
  
  # validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :device_type_id, presence: true
  validates :manufacturer_id, presence: true
  
  
  
  
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

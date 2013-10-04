class License < ActiveRecord::Base
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
  belongs_to :license_type
  belongs_to :organisation
  
  
  
  
  # has many
  has_many :systems, dependent: :restrict_with_error
  
  # # has many through
  # has_many :network_uses, through: :network_interfaces
  
  # accepts nested
  # accepts_nested_attributes_for :network_interfaces, allow_destroy: true
  
  # validations
  validates :key, presence: true
  validates :quantity, presence: true
  validates_numericality_of :quantity, :only_integer => true, :greater_than_or_equal_to => 0
  
  
  
  before_destroy :protect_unknown_none
  
  private
  
  def protect_unknown_none
    !name.downcase.eql?("unknown") and !name.downcase.eql?("none")
  end
  
  protected
  
  def strip_blanks
     self.quantity = self.quantity.strip
  end
  
end

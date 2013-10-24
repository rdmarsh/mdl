class OperatingSystem < ActiveRecord::Base
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
  belongs_to :organisation
  belongs_to :operating_system_family
  
  
  
  
  # has many
  has_many :systems, dependent: :restrict_with_error
  
  # validations
  validates :name, presence: true, uniqueness: { case_sensitive: false, :scope => :release,
     message: "Name and Release combination already present" }
  validates :release, presence: true
  validates :operating_system_family_id, presence: true
  
  
  
  
  before_destroy :protect_unknown_none
  
  
  
  private
  
  def os_and_release
    "#{name} (#{release})"
  end
  
  def protect_unknown_none
    !name.downcase.eql?("unknown") and !name.downcase.eql?("none")
  end
  
  protected
  
  def strip_blanks
    self.name = self.name.strip
  end
  
end

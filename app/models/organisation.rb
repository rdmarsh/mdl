class Organisation < ActiveRecord::Base
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
  def slug_candidates
    [
      :name,
      [:name, :full_name]
    ]
  end
  
  before_validation :strip_blanks
  
  # belongs to
  belongs_to :relationship
  
  
  
  
  
  # has many
  has_many :systems, dependent: :restrict_with_error
  
  # validations
  validates_format_of :name, :with => /\A[a-zA-Z\d]+\z/, :message => "Can only contain letters and numbers."
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :full_name, presence: true
  validates :relationship_id, presence: true
  
  
  before_destroy :protect_unknown_none
  
  private
  
  def vendor_only
    "#{name} ----"
  end
  
  def protect_unknown_none
    !name.downcase.eql?("unknown") and !name.downcase.eql?("none")
  end
  
  protected
  
  def strip_blanks
    self.name = self.name.strip
  end
  
end

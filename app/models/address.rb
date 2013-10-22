class Address < ActiveRecord::Base
  include PublicActivity::Common
  
  # friendly IDs, better URLs
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  # regenerate new slugs?
  def should_generate_new_friendly_id?
    name_changed?
  end
  
  
  
  
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  
  
  
  
  before_validation :strip_blanks
  
  # belongs to
  # belongs_to :addressable, polymorphic: true
  belongs_to :organisation, polymorphic: true
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  after_validation :geocode
  
  before_destroy :protect_unknown_none
  
  private
  
  def protect_unknown_none
    !name.downcase.eql?("unknown") and !name.downcase.eql?("none")
  end
  
  protected
  
  def strip_blanks
    self.name = self.name.strip
  end
  
  def address
    [street_address_1, street_address_2, city, state, postcode, country].compact.join(', ')
  end
end
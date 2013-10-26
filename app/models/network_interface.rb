class NetworkInterface < ActiveRecord::Base
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
  
  before_validation :strip_blanks, :downcase
  
  # belongs to
  belongs_to :network_use
  belongs_to :system
  
  
  
  
  # has many
  
  
  # validations
  validates :name, presence: true
  validates :vlan, presence: true
  validates :ipaddress, presence: true, :ip => { :format => :v4 }
  validates :netmask, presence: true, :ip => { :format => :v4 }
  validates :prefix, presence: true, :ip => { :format => :v4 }
  validates :broadcast, presence: true, :ip => { :format => :v4 }
  validates :gateway, presence: true, :ip => { :format => :v4 }
  validates :network_use, presence: true
  validates :system, presence: true
  
  
  
  
  before_destroy :protect_unknown_none
  
  private
  
  def protect_unknown_none
    !name.downcase.eql?("unknown") and !name.downcase.eql?("none")
  end
  
  protected
  
  def strip_blanks
    self.name = self.name.strip
  end
  
  def downcase
    self.name = self.name.downcase
  end
  
end

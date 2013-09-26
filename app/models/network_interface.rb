class NetworkInterface < ActiveRecord::Base
  include PublicActivity::Common
  
  before_validation :strip_blanks
  
  # belongs to
  belongs_to :network_use
  belongs_to :device
  
  
  
  
  # has many
  
  
  # validations
  validates :name, presence: true
  validates :ipaddress,          :ip => { :format => :v4 }, if: "ipaddress.nil?"
  validates :network_use, presence: true
  validates :device, presence: true
  
  
  
  
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

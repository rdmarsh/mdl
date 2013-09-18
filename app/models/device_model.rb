class DeviceModel < ActiveRecord::Base
  include PublicActivity::Model
  tracked
  
  before_validation :strip_blanks
  
  # belongs to
  belongs_to :device_type
  belongs_to :manufacturer
  
  
  
  
  # has many
  has_many :devices, dependent: :restrict_with_error
  
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

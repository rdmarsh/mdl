class System < ActiveRecord::Base
  include PublicActivity::Common
  
  before_validation :strip_blanks
  
  # belongs to
  belongs_to :device_model
  belongs_to :environment
  belongs_to :organisation
  belongs_to :service_level
  belongs_to :support_level
  
  # has many
  has_many :network_interfaces, dependent: :restrict_with_error
  
  # # has many through
  # has_many :network_uses, through: :network_interfaces
  
  # accepts nested
  # accepts_nested_attributes_for :network_interfaces, allow_destroy: true
  
  # validations
  validates :name, presence: true
  validates :device_model_id, presence: true
  validates :environment_id, presence: true
  validates :organisation_id, presence: true
  validates :service_level_id, presence: true
  validates :support_level_id, presence: true
  
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

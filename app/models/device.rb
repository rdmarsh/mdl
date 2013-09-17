class Device < ActiveRecord::Base
  include PublicActivity::Model
  tracked
  
  before_validation :strip_blanks
  
  belongs_to :device_model
  belongs_to :organisation
  belongs_to :support_level
  belongs_to :service_level
  belongs_to :environment

  
  # validations
  validates :name, presence: true
  
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

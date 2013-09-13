class SupportLevel < ActiveRecord::Base
  before_validation :strip_blanks
  
  has_many :organisations
  
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :hours, presence: true
  validates :days, presence: true
  
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
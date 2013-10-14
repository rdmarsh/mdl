class Address < ActiveRecord::Base
  include PublicActivity::Common
  
  # before_validation :strip_blanks
  
  # belongs to
  belongs_to :organisation
  
  # before_destroy :protect_unknown_none
  
  private
  
  def protect_unknown_none
    !name.downcase.eql?("unknown") and !name.downcase.eql?("none")
  end
  
  protected
  
  def strip_blanks
      self.name = self.name.strip
  end
end

# as per railscasts 103
class Announcement < ActiveRecord::Base
  include PublicActivity::Common
  
  before_validation :strip_blanks
  
  validates :message, presence: true
  
  def self.current(hidden_ids = nil)
    result = where("starts_at <= :now and ends_at >= :now", now: Time.zone.now)
    result = result.where("id not in (?)", hidden_ids) if hidden_ids.present?
    result
  end
  
  protected
  
  def strip_blanks
    self.message = self.message.strip
  end
  
end

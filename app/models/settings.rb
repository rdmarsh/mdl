class Settings < ActiveRecord::Base
  validates_presence_of :company_name
end

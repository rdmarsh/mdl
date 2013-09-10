class DeviceType < ActiveRecord::Base
  validates :name, presence: true
end

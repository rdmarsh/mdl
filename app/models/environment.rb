class Environment < ActiveRecord::Base
  validates :name, presence: true
end

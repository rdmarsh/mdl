class User < ActiveRecord::Base
  has_secure_password
  
  include PublicActivity::Common
  
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
end

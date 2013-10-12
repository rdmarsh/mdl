class Note < ActiveRecord::Base
  include PublicActivity::Common
  
  belongs_to :noteable, polymorphic: true
end

class Comment < ActiveRecord::Base
  include PublicActivity::Common
  
  belongs_to :commentable, polymorphic: true
end

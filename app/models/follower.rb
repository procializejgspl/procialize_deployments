class Follower < ActiveRecord::Base
  attr_accessible :conference_id, :follower_id, :user_id
  belongs_to :user

end

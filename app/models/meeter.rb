class Meeter < ActiveRecord::Base
  attr_accessible :meeting_id, :status, :user_id

  validates :meeting_id,:numericality => true, :allow_blank => true
  validates :user_id,:numericality => true, :allow_blank => true

  belongs_to :meeting
  belongs_to :user

end

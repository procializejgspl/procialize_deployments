class Recipient < ActiveRecord::Base
  attr_accessible :message_id, :user_id ,:status

  validates :message_id,:numericality => true, :allow_blank => true
  validates :user_id,:numericality => true, :allow_blank => true

  belongs_to :user
  belongs_to :message
end

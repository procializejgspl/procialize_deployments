class Feed < ActiveRecord::Base
  attr_accessible :message, :user_id
  belongs_to :user

  validates_presence_of :message
  validates_presence_of :user_id
  validates :message,format: { with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }


end

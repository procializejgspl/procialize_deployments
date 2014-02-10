class Questionable < ActiveRecord::Base
  attr_accessible :approved, :event_id, :likes, :quest_name, :user_id

  belongs_to :event
  validates :quest_name,format: {with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }


end





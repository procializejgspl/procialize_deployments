class Post < ActiveRecord::Base
  attr_accessible :conference_id, :name, :user_id

  belongs_to :user
  belongs_to :conference
  validates :name,format: { with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }


end

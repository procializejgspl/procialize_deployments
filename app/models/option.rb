class Option < ActiveRecord::Base
  attr_accessible :name, :question_id ,:correct
  belongs_to :question
  validates :name,format: { with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }


end
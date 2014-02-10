class Question < ActiveRecord::Base
  attr_accessible :name, :survey_id
  belongs_to :survey
  has_many :options
  validates :name,format: {with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }


end
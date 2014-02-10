class Location < ActiveRecord::Base
  attr_accessible :conference_id, :name

  belongs_to :conference

  validates :name, format: { with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }


end

class Survey < ActiveRecord::Base
  attr_accessible :description, :display, :name
  has_many :questions
  validates :name,format: { with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }

  validates :description,format: { with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }


end

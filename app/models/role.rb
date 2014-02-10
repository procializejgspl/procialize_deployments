class Role < ActiveRecord::Base
  attr_accessible :description, :name ,:can_message,:can_meet
  has_many :users
  validates :name,format: { with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }

  validates :description,:allow_blank=> true,:format=>{ with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }



end

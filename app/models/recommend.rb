class Recommend < ActiveRecord::Base
  attr_accessible :done, :type, :user_id ,:recommended_id

  belongs_to :user
  belongs_to :recommended,:class_name => "User"

end

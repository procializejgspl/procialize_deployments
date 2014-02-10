class Employee < ActiveRecord::Base
  attr_accessible :people_id, :user_id
  belongs_to :user
  belongs_to :people,:class_name => "User"
end

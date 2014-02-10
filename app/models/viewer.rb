class Viewer < ActiveRecord::Base
  attr_accessible :count, :user_id    ,:viewed_by

  belongs_to :user
end

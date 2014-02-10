class Downloadble < ActiveRecord::Base
  attr_accessible :asset_dwnld, :track_id

  has_attached_file :asset_dwnld

  belongs_to :asset
end

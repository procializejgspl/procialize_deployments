class Asset < ActiveRecord::Base
  attr_accessible :content, :type

  has_attached_file :content

  belongs_to :user

  #has_many :downloadbles,:dependent => :destroy
end

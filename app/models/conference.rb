class Conference < ActiveRecord::Base
  attr_accessible :description, :name

  validates_presence_of :name

  has_many :event_days,:dependent => :destroy
  has_many :messages,:dependent => :destroy
  has_many :posts,:dependent => :destroy
  has_many :locations,:dependent => :destroy
end

class Track < ActiveRecord::Base
  attr_accessible :description,  :name,:event_ids

  validates_presence_of :name
  validates_presence_of :description

  #has_many :conferences,:dependent => :destroy

  has_and_belongs_to_many :events
  #has_many :events,:dependent => :destroy
  has_many :event_days,:through => :events

  validates :name,format: { with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }


  validates :description,format: { with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }


end

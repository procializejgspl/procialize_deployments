class EventDay < ActiveRecord::Base
  attr_accessible :conference_id, :event_date, :name
  #
  validates_presence_of :name
  validates_presence_of :event_date
  #validates :sequence,:numericality => true, :allow_blank => true
  #validates :conference_id,:numericality => true, :allow_blank => true

  has_many :events,:dependent => :destroy
  has_many :tracks,:through => :events

  belongs_to :conference
  validates :name,format: { with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }


end

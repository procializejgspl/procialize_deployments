class Event < ActiveRecord::Base
  attr_accessible :description, :ending_at, :name, :starting_at, :event_asset, :track_ids, :event_day_id

  has_attached_file :event_asset

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :starting_at
  validates_presence_of :ending_at
  #validates :track_id,:numericality => true, :allow_blank => true
  validates :event_day_id,:numericality => true, :allow_blank => true

  has_many :questionables,:dependent => :destroy
  has_many :feedbacks,:dependent => :destroy
  has_many :attendees,:dependent => :destroy

  validates :name,format: { with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }

  validates :description,format: { with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }



  #has_many :event_speakers,:dependent => :destroy
  #has_many :speakers,:through => :event_speakers

  belongs_to :event_day
  #belongs_to :track
  has_and_belongs_to_many :tracks



end

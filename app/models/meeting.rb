class Meeting < ActiveRecord::Base
  attr_accessible :end_time, :location, :name, :start_time, :user_id


  validates_presence_of :name,:message=>"cannot be blank"
  validates_presence_of :location
  validates_presence_of :start_time

  #validates_presence_of :end_time
  validates :user_id,:numericality => true, :allow_blank => true

  has_many :meeters, :dependent => :destroy
  has_many :users, :through => :meeters

  validates_presence_of :meeters

  validates :name,format: { with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }





  after_create :send_confirmation_email

  def send_confirmation_email
    self.users.each do |u|
      UserMailer.meeting_confirmation(u.email,User.find(self.user_id).name).deliver!
    end

  end

end

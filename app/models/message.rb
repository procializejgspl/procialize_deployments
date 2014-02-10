class Message < ActiveRecord::Base
  attr_accessible :body, :conference_id, :subject, :user_id

  #validates_presence_of :name
  validates_presence_of :body,:message=>"Cannot be blank"
  validates :user_id,:numericality => true, :allow_blank => true
  validates :conference_id,:numericality => true, :allow_blank => true
  validates_presence_of :subject,:message => "Cannot be blank "
  has_many :recipients,:dependent => :destroy
  has_many :users,:through => :recipients
  belongs_to :user

  validates_presence_of :recipients

  validates :subject,format: { with: /^\S.*\S$/,
            message: "No space in the beginning or end " }
  validates :body,format: { with: /^\S.*\S$/,
                               message: "No space in the beginning or end " }


  after_create :send_confirmation_email

  def send_confirmation_email
    self.recipients.each do |u|
      UserMailer.msg_confirmation(u.user.email,self.user.name).deliver!
    end

  end
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :title, :body
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name ,:company, :headline, :industry, :interest, :location,:provider,:uid,:is_admin,:user_pic,:role_id,:extra_info

  has_attached_file :user_pic   , :default_url => "/assets/user_dummy.jpg"


  has_many :meeters, :dependent => :destroy
  has_many :meetings, :through => :meeters

  has_many :feeds ,:dependent => :destroy


  has_many :recipients,:dependent => :destroy
  has_many :messages,:through => :recipients


  has_many :events,:dependent => :destroy

  has_many :feedbacks,:dependent => :destroy

  has_many :attendees,:dependent => :destroy

  has_many :posts,:dependent => :destroy

  has_many :viewers,:dependent => :destroy

  has_many :recommends,:dependent => :destroy

  has_many :assets
  #accepts_nested_attributes_for :assets
  accepts_nested_attributes_for :assets, :allow_destroy => true
  attr_accessible :assets_attributes

  has_many :followers,:dependent => :destroy



  belongs_to :role
  validates_presence_of :role

  validates_presence_of :name


  validates :name,  format: {with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }

  validates :email,format: { with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }


  validates :industry,  :allow_blank => true,format: { with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }

  validates :interest,  :allow_blank => true,format: { with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }


  validates :headline,  :allow_blank => true,format: { with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }

  validates :company,  :allow_blank => true,format: {with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }

  validates :extra_info,  :allow_blank => true,format: { with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }

  validates :location,  :allow_blank => true,format: {with: /^\S.*\S$/,
                            message: "No space in the beginning or end " }






  has_many :employees
  #has_many :peoples,:through => :employees






  before_create :set_standard_password
  before_validation :set_standard_password

  def set_standard_password
    self.password="password"
    self.password_confirmation="password"

    true


  end

  #def before_import_save(row,map)
  #  ud = row.split(",")
  #  User.create!(:email=>ud[0],:password=>ud[1],:password_confirmation=>ud[2])
  #
  #end



  def self.connect_to_linkedin(auth, signed_in_resource=nil)
    if signed_in_resource.nil?
      registered_user_via_linkedin = User.where(:email => auth.info.email).first
    else
      registered_user = User.where(:email => signed_in_resource.email).first
      end
      if registered_user
        registered_user.provider = auth.provider
        registered_user.uid = auth.uid
        registered_user.headline=auth.info.headline
        registered_user.industry = auth.info.industry
        registered_user.location  = auth.info.location
        registered_user.save!
        return [registered_user,"Account linked successfully"]
      else
       if registered_user_via_linkedin
        return [registered_user_via_linkedin,"Signed in Succesfully"]
       else
        user = User.create!(name:auth.info.first_name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20],
                           headline: auth.info.headline,
                           industry: auth.info.industry,
                           location: auth.info.location,
                           interest:auth.info.interests,
                           role_id:Role.first.id


        )
        return [user,"Authentication Successful"]
      end

   end
  end

end

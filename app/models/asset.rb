class Asset < ActiveRecord::Base
  attr_accessible :content, :type_of_asset, :user_id

  has_attached_file :content

  belongs_to :user

  #has_many :downloadbles,:dependent => :destroy

  after_create :send_brochure_mail

  def send_brochure_mail
    if self.type_of_asset === 'brochure'
      UserMailer.brochure_upload_mail(self.user).deliver!
    end
  end

end

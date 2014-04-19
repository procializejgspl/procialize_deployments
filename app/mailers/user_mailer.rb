class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def recommend_confirmation(user)
    @user = user
    mail(:to => user, :subject => Customizer.first.mail_subject)
  end

  def msg_confirmation(user,from_user)
    @user=user
    @from_user = from_user
    mail(:to => user, :subject => Customizer.first.mail_subject)
  end

  def meeting_confirmation(user,from_user)
    @user=user
    @from_user = from_user
    mail(:to => user, :subject => Customizer.first.mail_subject)
  end

  def brochure_upload_mail(user)
    @user=user
    mail(:to => user.email, :subject => 'Brochure Uploaded on Procialize')
  end

end

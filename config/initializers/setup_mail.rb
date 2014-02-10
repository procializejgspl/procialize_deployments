ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "gmail.com",
    :user_name => "procialize@gmail.com",
    :password => "ptotem123",
    :authentication => "plain",
    #:user_name => "railscasts",
    #:password => "secret",
    :enable_starttls_auto => true
}
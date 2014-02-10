class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def linkedin
    auth = env["omniauth.auth"]
    linkedin_data= User.connect_to_linkedin(request.env["omniauth.auth"],current_user)
    @user = linkedin_data[0]
    sign_in @user
    redirect_to root_path,:notice =>linkedin_data[1]
    #render :text=>@user.email
    #return
    #if @user.persisted?
    #  flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
    #  sign_in_and_redirect root_path, :event => :authentication
    ##else
    #  #session["devise.twitter_uid"] = request.env["omniauth.auth"]
    #  #redirect_to new_user_registration_url
    #end
  end
  end
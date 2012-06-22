class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  skip_before_filter :verify_authenticity_token, :only => [:google]

  def google
    @user = User.find_for_google(request.env["omniauth.auth"], current_user)
    sign_in(@user)
    flash[:notice] = "You have signed in!"
    redirect_to root_url
  end
end


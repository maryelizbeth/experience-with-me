class User::SessionsController < Devise::SessionsController
  before_filter :authenticate_user!

  def new 
    super
    @current_user = current_user
  end 

  def destroy
    reset_session
    redirect_to root_url
  end 
end

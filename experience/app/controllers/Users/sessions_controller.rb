class SessionsController < Devise::SessionsController
  before_filter :authenticate_user!

  def new 
    super
    @current_user = current_user
  end 

  def destroy
  end 
end

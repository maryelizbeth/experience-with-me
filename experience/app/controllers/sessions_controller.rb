class Users::SessionsController < Devise::SessionsController
  before_filter :authenticate_user!

  def new 
    super
  end 

  def create 

  end 

  def destroy
    
  end 
end

class AuthenticationsController < ApplicationController
  def create 
    auth = request.env["omniauth.auth"]
    uid = auth ["uid"]
    token = auth["credentials"]["token"]

    provider = auth[:provider]
    authentication = current_user.authentications.build(provider:provider, uid:uid, token:token, secret:secret, login:login)
    if current_user.save 
      flash[:notice] = "You have been logged in." 
    else 
      flash[:error] = authentications.errors[:base].first
    end 
    redirect_to root
  end 

  def destroy 
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy 
    flash[:notice] = "You have successfully logged out."

    respond_to do |format| 
      format.html{ redirect_to dashboard_url }
      format.json { head :no_content }
    end 
  end 
end
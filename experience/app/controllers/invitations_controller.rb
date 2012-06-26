
class InvitationsController < ApplicationController

  def new
    @invitation = Invitation.new
  end 

  def create 
    @invitation = Invitation.new(params[:invitation])
    @invitation.sender = current_user
    if @invitation.save 
      if logged_in?
        Mailer.deliver_invitation(@invitation, signup_url(@invitation.token))
        flash[:notice] = "Your friends have been invited to join you on this adventure."
        redirect_to root_url
      else 
        flash[:notice] = "Something went wrong during the invitation situation."
        redirect_to root_url
      end 
    else 
      render :action => 'new'
    end   
  end

  def index 
    # view all invitations a user has sent to their contacts 
  end 
end

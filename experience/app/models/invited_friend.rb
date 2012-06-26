class InvitedFriend < ActiveRecord::Base
  attr_accessible :adventure_id, :email, :user_id

  def self.invite_to_adventure(token)
    adventure = Adventure.find_from_invitation_token(invitation_token)
    create(adventure_id: adventure_id)
  end 

  #will need resque task to determine changes in invited friends availability?
  #resque task may also be attributed to Friend
end

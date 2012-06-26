class Invitation < ActiveRecord::Base
  attr_accessible :recipient_email, :user_id, :invitation_token

  belongs_to :user
  has_one :recipient 


end

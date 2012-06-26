class Mailer < ActiveRecord::Base
  def invitation 
    subject 'Invitation'
    recipients invitation.recipient_email 
    from invitation.sender_email
    body :invitation => invitation, :signup_url => signup_url
    invitation.update_attribute (:sent_at)
  end 
end

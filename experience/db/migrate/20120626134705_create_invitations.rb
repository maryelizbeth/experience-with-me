class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :recipient_email 
      t.string :user_id
      t.string :invitation_token
      t.timestamps
    end
  end
end

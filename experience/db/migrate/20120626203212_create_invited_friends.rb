class CreateInvitedFriends < ActiveRecord::Migration
  def change
    create_table :invited_friends do |t|

      t.timestamps
    end
  end
end

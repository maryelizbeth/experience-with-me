class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string  :provider 
      t.integer :uid
      t.string  :user_id 
      t.string  :token 
      t.string  :avatar 
      t.string  :refresh_token

      t.timestamps
    end
  end
end

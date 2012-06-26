class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Rememberable
      t.string :encrypted_password
      t.string :password 
      t.string :password_confirmation
      t.string :name
      t.string :email

      t.timestamps
    end

    add_index :users, :email, :unique => true
  end
end

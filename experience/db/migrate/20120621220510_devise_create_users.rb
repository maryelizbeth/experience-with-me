class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Rememberable
      t.datetime :remember_created_at
      t.string :name
      t.string :email
      t.string :calendar_id
      t.string :uid

      t.timestamps
    end

    add_index :users, :email, :unique => true
    add_index :users, :uid, :unique => true
  end
end

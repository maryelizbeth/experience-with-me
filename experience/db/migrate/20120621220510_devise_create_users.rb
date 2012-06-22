class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Rememberable
      t.datetime :remember_created_at
      t.string :name
      t.string :email

      t.timestamps
    end

    add_index :users, :email, :unique => true
  end
end

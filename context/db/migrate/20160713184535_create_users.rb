class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :hashed_password, null: false
      t.string :salt,            null: false
      t.string :email,           null: false

      t.timestamps
    end

    add_index :users, :email
  end
end

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :password_digest
      t.string :session_token, uniqueness: true

      t.timestamps
    end
  end
end

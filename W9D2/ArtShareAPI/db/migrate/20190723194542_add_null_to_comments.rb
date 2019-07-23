class AddNullToComments < ActiveRecord::Migration[5.2]
  def change
    change_table :comments do |t|
      t.remove :user_id
      t.remove :artwork_id
      t.integer :user_id, null: false
      t.integer :artwork_id, null: false
    end

  end
end

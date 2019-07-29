class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :user_id, null: false
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.integer :location_id

      t.timestamps
    end
  end
end

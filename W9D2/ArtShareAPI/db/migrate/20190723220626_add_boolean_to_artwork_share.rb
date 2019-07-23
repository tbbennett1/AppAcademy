class AddBooleanToArtworkShare < ActiveRecord::Migration[5.2]
  def change
    change_table :artwork_shares do |t|
      t.boolean :favorite
    end
  end
end

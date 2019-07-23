class AddBooleanToArtwork < ActiveRecord::Migration[5.2]
  def change
    change_table :artworks do |t|
      t.boolean :favorite
    end
  end
end

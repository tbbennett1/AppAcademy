class CreateArtworkCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_collections do |t|
      t.integer :artwork_id, null: false
      t.integer :collection_id, null: false
      t.timestamps
    end
  end
end

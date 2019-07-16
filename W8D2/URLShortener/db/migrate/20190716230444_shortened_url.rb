class ShortenedUrl < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|  
      t.text :short_url
      t.text :long_url

      t.integer :user_id
      t.timestamps
    end
  end
end

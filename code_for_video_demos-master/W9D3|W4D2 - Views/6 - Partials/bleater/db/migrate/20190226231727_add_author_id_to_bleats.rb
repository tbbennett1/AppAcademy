class AddAuthorIdToBleats < ActiveRecord::Migration[5.2]
  def change
    add_column :bleats, :author_id, :integer
  end
end

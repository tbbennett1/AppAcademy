class ChangeDescriptionColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :cats, :descripton, :description
  end
end

class RemoveEmailName < ActiveRecord::Migration[5.2]

    def change
      change_table :users do |t|
        t.remove :name
        t.remove :email
        t.string :username
      end
    end
end

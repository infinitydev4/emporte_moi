class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :keyword
      t.string :category
      t.float :min_prix
      t.float :max_prix
      t.string :prénom
      t.string :nom

      t.timestamps
    end
  end
end

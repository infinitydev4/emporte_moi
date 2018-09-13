class PlatsCategory < ActiveRecord::Migration[5.2]
  def change
    create_table :plats_categories, id: false do |t|
      t.belongs_to :plat, index: true
      t.belongs_to :category, index: true
    end
  end
end

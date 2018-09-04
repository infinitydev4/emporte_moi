class CreatePanierPlat < ActiveRecord::Migration[5.2]
  def change
    create_table :panier_plats do |t|
      t.belongs_to :panier, foreign_key: true
      t.belongs_to :plat, foreign_key: true
    end
  end
end

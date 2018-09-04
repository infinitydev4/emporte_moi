class CreatePanierPlat < ActiveRecord::Migration[5.2]
  def change
    create_table :paniers_plats do |t|
      belongs_to :panier, foreign: true
      belongs_to :plat, foreign: true
    end
  end
end

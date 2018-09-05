class ChangeQuantiteToStock < ActiveRecord::Migration[5.2]
  def change
    rename_column :plats, :quantité, :stock
    remove_column :paniers, :quantité, :integer
    add_column :paniers_plats, :quantité, :integer
  end
end

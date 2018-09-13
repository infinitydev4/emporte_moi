class Changeprix < ActiveRecord::Migration[5.2]
  def change
    change_column :plats, :prix, :float
  end
end

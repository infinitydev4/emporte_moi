class AddIndexToPlat < ActiveRecord::Migration[5.2]
  def change
    add_reference :plats, :restaurant, index: true
  end
end

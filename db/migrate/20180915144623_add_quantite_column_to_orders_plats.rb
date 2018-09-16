class AddQuantiteColumnToOrdersPlats < ActiveRecord::Migration[5.2]
  def change
    add_column :orders_plats, :quantité, :integer
  end
end

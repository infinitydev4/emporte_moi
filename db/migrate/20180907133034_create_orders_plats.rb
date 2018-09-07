class CreateOrdersPlats < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_plats do |t|
      t.belongs_to :order, foreign_key: true
      t.belongs_to :plat, foreign_key: true
      t.timestamps
    end
  end
end

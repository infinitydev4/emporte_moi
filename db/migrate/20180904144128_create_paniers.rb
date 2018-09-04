class CreatePaniers < ActiveRecord::Migration[5.2]
  def change
    create_table :paniers do |t|
      t.integer :quantité
      t.belongs_to :user, index: { unique: true }, foreign_key: true
      t.timestamps
    end
  end
end

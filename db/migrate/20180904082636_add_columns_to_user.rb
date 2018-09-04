class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :prénom, :string
    add_column :users, :nom, :string
    add_column :users, :ville, :string
    add_column :users, :téléphone, :string
  end
end

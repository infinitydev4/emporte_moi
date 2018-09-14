class AddAdresseColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :adresse, :string
  end
end

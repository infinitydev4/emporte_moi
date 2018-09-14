class AddAuthorColumnToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :auteur_id, :integer
  end
end

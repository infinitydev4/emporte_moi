class RemoveTitreColumnFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :titre, :string
  end
end

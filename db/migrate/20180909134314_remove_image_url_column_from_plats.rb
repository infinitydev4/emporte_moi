class RemoveImageUrlColumnFromPlats < ActiveRecord::Migration[5.2]
  def change
    remove_column :plats, :image_url
  end
end

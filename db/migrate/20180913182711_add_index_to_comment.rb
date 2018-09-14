class AddIndexToComment < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :restaurant, index: true
  end
end

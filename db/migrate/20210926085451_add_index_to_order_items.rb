class AddIndexToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_index :order_items, [:order_id, :pizza_type_id], unique: true
  end
end

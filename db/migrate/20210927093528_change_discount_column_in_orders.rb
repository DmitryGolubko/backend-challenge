class ChangeDiscountColumnInOrders < ActiveRecord::Migration[6.1]
  def up
    change_column :orders, :discount, :decimal, precision: 8, scale: 2, default: "0.0"
  end

  def down
    change_column :orders, :discount, :decimal, precision: 3, scale: 2, default: "0.0"
  end
end

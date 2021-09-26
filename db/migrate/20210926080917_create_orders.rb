class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :cost, default: 0, precision: 8, scale: 2
      t.decimal :total_cost, default: 0, precision: 8, scale: 2
      t.decimal :discount, default: 0, precision: 3, scale: 2

      t.timestamps
    end
  end
end

class CreatePizzaTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :pizza_types do |t|
      t.string :name
      t.decimal :price, default: 0, precision: 8, scale: 2

      t.timestamps
    end
  end
end

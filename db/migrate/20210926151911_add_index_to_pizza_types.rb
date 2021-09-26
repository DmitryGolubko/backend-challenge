class AddIndexToPizzaTypes < ActiveRecord::Migration[6.1]
  def change
    add_index :pizza_types, :name, unique: true
  end
end

# == Schema Information
#
# Table name: pizza_types
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  price      :decimal(8, 2)    default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PizzaType < ApplicationRecord
  validates :name, length: { minimum: 1, maximum: 50 }, presence: true, uniqueness: true
  validates :price, numericality: { greater_than: 0, less_than_or_equal_to: 999_999.99 }, presence: true
end

# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  cost       :decimal(8, 2)    default(0.0)
#  total_cost :decimal(8, 2)    default(0.0)
#  discount   :decimal(3, 2)    default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Order < ApplicationRecord
  DISCOUNTS = {
    silver: 0.05,
    gold: 0.1
  }.freeze

  DISCOUNT_CONDITIONS = {
    silver: 50,
    gold: 100
  }.freeze

  has_many :order_items, dependent: :destroy

  validates :order_items, length: { minimum: 1 }

  accepts_nested_attributes_for :order_items, reject_if: :all_blank, allow_destroy: true
end

# == Schema Information
#
# Table name: order_items
#
#  id            :bigint           not null, primary key
#  order_id      :bigint
#  pizza_type_id :bigint
#  quantity      :integer          default(1)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class OrderItem < ApplicationRecord
  belongs_to :pizza_type
  belongs_to :order

  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :pizza_type_id, uniqueness: { scope: :order_id }
end

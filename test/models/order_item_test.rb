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
require "test_helper"

class OrderItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

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
require "test_helper"

class PizzaTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

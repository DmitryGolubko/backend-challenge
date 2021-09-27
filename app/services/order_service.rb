class OrderService
  attr_reader :order

  def initialize(order_params)
    @order = Order.new(order_params)
    calculate_total
  end

  def calculate_total
    @order.order_items.map do |order_item|
      next unless order_item.pizza_type

      @order.cost += order_item.quantity * order_item.pizza_type.price
    end
    @order.total_cost = @order.cost

    return unless _discount

    @order.discount = @order.cost * _discount
    @order.total_cost = @order.cost - (@order.cost * _discount)
  end

  def _discount
    Order::DISCOUNTS[Order::DISCOUNT_CONDITIONS.key(Order::DISCOUNT_CONDITIONS.values.find_all { |v| v <= @order.cost.to_i }.last)]
  end
end

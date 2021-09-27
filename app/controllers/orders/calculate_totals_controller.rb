module Orders
  class CalculateTotalsController < ApplicationController
    def create
      @order = OrderService.new(order_params).order

      respond_to do |format|
        format.json { render json: { 'cost': @order.cost, 'total': @order.total_cost, 'discount': @order.discount }.to_json, status: :ok }
      end
    end

    private

    def order_params
      params.require(:order).permit(order_items_attributes: %i[pizza_type_id quantity _destroy])
    end
  end
end

class OrdersController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @orders = Order.all.includes(order_items: [:pizza_type])

    respond_to do |format|
      format.html
      format.json do
        render json: @orders, include: [order_items: { only: :quantity, include: { pizza_type: { only: [:id, :name] } } }]
      end
    end
  end

  def new
    @order = Order.new
    @order.order_items.build
    @pizza_types = PizzaType.order(:name).all.pluck(:name, :id)
  end

  def create
    @order = OrderService.new(order_params).order
    if @order.save
      redirect_to orders_url
    else
      render :new
    end
  end

  def show
    @order = Order.includes(order_items: [:pizza_type]).find(params[:id])

    respond_to do |format|
      format.json do
        render json: @order, include: [order_items: { only: :quantity, include: { pizza_type: { only: [:id, :name] } } }]
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(order_items_attributes: %i[pizza_type_id quantity _destroy])
  end
end

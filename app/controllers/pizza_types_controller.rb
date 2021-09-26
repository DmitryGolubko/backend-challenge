class PizzaTypesController < ApplicationController
  before_action :load_pizza, only: %i[edit update destroy]

  def index
    @pizza_types = PizzaType.all
  end

  def new
    @pizza_type = PizzaType.new
  end

  def create
    @pizza_type = PizzaType.new(pizza_type_params)
    if @pizza_type.save
      redirect_to pizza_types_url
    else
      render :new
    end
  end

  def edit; end

  def update
    @pizza_type.update(pizza_type_params)
    if @pizza_type.save
      redirect_to pizza_types_url
    else
      render :edit
    end
  end

  def destroy
    @pizza_type.destroy

    redirect_to pizza_types_url
  end

  private

  def pizza_type_params
    params.require(:pizza_type).permit(:name, :price)
  end

  def load_pizza
    @pizza_type = PizzaType.find(params[:id])
  end
end

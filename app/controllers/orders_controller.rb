class OrdersController < ApplicationController

  def index

  end

  def show

  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def order_params
    params.require(:order).permit(:service_id, :user_id)
  end

end

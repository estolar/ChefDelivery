class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show

  end

  def new
    @service = Service.find(params[:service_id])
    @order = Order.new
  end

  def create
    @service = Service.find(params[:service_id])
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

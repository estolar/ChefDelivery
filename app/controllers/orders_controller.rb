class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
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
    @order = Order.find(params[:id])
    # @service = Service.find(@order.service_id)
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to order_path(@order)
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path, status: :see_other
  end

  def new_offer
    @order = Order.find(params[:id])
    @service = @order.service # Obtener el servicio relacionado
    @owner = @service.user     # Obtener el dueño del servicio (usuario dueño)
    @client = @order.user      # Obtener el cliente (usuario que realizó la orden)
  end

  def create_offer
    @order = Order.find(params[:id])
    if @order.update(status: params[:order][:status])
      flash[:notice] = "Orden actualizada exitosamente."
    else
      flash[:alert] = "No se pudo actualizar la orden."
    end
    redirect_to @order
  end

  private

  def order_params
    params.require(:order).permit(:service_id, :user_id, :reservation, :num_people, :status_id)
  end

end

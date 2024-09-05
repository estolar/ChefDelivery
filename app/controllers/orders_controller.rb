class OrdersController < ApplicationController
  def show
  end

  def create
  end

  def new
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
end

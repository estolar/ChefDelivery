class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to services_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @service = Service.find(params[:id])
  end

  private

  def service_params
    params.require(:service).permit(:name, :description, :cost, :category_id, :user_id, photos: [])
  end
end

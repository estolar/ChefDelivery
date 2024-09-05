class PagesController < ApplicationController
  # Se salta la autenticacion unicamente para el home
 skip_before_action :authenticate_user!, only: :home

  def home
    @services = Service.all
  end
end

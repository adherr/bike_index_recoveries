class RecoveriesController < ApplicationController
  def index
    @bikes = Bike.all.page(params[:bikes_page]).per_page(20)
  end
end

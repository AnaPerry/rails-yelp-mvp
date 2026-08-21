class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [ :show, :edit, :update, :destroy ]

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  def show
  end

  def edit
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end

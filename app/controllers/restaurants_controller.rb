class RestaurantsController < ApplicationController
  before_action :authenticate_owner!, except: [:index, :show]
  before_action :set_restaurant, only: [:update, :edit, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    flash[:notice] = "Executed 'show' action"
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    flash[:notice] = "Executed 'new' action"
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    final_params = restaurant_params.merge(owner: current_owner)
    @restaurant = Restaurant.new(final_params)

    if @restaurant.save
      redirect_to @restaurant
    else
      flash[:notice] = "Executed 'create' action"
      render 'new'
    end
   end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant.destroy

    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = current_owner.restaurants.find(params[:id])
  rescue
    flash[:alert] = "You don't have permission to edit this restaurant"
    redirect_to root_path
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :description)
  end
end

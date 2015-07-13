class RestaurantsController < ApplicationController
  before_action :authenticate_owner!, except: [:index, :show]
  
  def index
  	@restaurants = Restaurant.all
  end
 
	def show
		@restaurant = Restaurant.find(params[:id])
	end

  def new
  	@restaurant = Restaurant.new
  end


  def edit
  	@restaurant = Restaurant.find(params[:id])
  end

  def create
    final_params = restaurant_params.merge(owner: current_owner)
    @restaurant = Restaurant.new(final_params)
  
   	if @restaurant.save
   		redirect_to @restaurant
   	else
   		render 'new'
   	end

   end

  def update
    @restaurant = Restaurant.find(params[:id])
 
	  if @restaurant.update(restaurant_params)
	    redirect_to @restaurant
	  else
	    render 'edit'
	  end
  end

  def destroy
	@restaurant = Restaurant.find(params[:id])
	@restaurant.destroy

	redirect_to restaurants_path
  end

 private
 
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :description)
  end

end

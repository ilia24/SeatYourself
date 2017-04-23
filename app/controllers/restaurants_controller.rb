class RestaurantsController < ApplicationController
before_action :ensure_logged_in, only:[:create, :new, :edit, :update, :destroy]

  def new
    @restaurant = Restaurant.new
  end

  def index
    @restaurants = Restaurant.all
  end

    def show
      @restaurant = Restaurant.find(params[:id])

      if current_user
        @review = @restaurant.reviews.build
      end
      @reservations = Reservation.all
    end

    def create
      @restaurant = Restaurant.new(restaurant_params)
      # Timeslot.create(params[:opentime], params[:closetime], 77, @restaurant.id)

      if @restaurant.save
        redirect_to restaurants_url
      else
        render :new
      end
    end

    def edit
      @restaurant = Restaurant.find(params[:id])
    end

    def update
      @restaurant = Restaurant.find(params[:id])

      if @restaurant.update_attributes(restaurant_params)
        redirect_to restaurant_path(@restaurant)
      else
        render :edit
      end
    end

    def destroy
      @restaurant = Restaurant.find(params[:id])
      @restaurant.destroy
      redirect_to restaurants_url
    end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :opentime, :closetime, :image_url, :capacity)
    end
end

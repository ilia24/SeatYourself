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

      if @restaurant.save

        tday = [0,0,0,0,0,0,0]
        weekday = Time.now.wday #weekday rolls from 0-6 sunday being 0
        weekvar = 0
        count = 0 #count is linked to weekday, but 1 day off so being 1-7
      while count <= 6 do
        dayadjust = 86400
        if weekday > 6
          weekday = 0
        end
        tday[weekday] = 0
        dayadjust *= count
        tday[weekday] += (dayadjust + weekvar)
        if count % 6 == 0 && count != 0
          Timeslot.create(@restaurant.sundayopen + tday[0], @restaurant.sundayclose + tday[0], @restaurant.capacity, @restaurant.id)
          Timeslot.create(@restaurant.mondayopen + tday[1], @restaurant.mondayclose + tday[1], @restaurant.capacity, @restaurant.id)
          Timeslot.create(@restaurant.tuesdayopen + tday[2], @restaurant.tuesdayclose + tday[2], @restaurant.capacity, @restaurant.id)
          Timeslot.create(@restaurant.wednesdayopen + tday[3], @restaurant.wednesdayclose + tday[3], @restaurant.capacity, @restaurant.id)
          Timeslot.create(@restaurant.thursdayopen + tday[4], @restaurant.thursdayclose + tday[4], @restaurant.capacity, @restaurant.id)
          Timeslot.create(@restaurant.fridayopen + tday[5], @restaurant.fridayclose + tday[5], @restaurant.capacity, @restaurant.id)
          Timeslot.create(@restaurant.saturdayopen + tday[6], @restaurant.saturdayclose + tday[6], @restaurant.capacity, @restaurant.id)
          weekvar += 604800
        end
        weekday += 1
        count += 1
      end
        redirect_to restaurant_url(@restaurant)
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
      params.require(:restaurant).permit(:name, :mondayopen, :mondayclose, :tuesdayopen, :tuesdayclose, :wednesdayopen, :wednesdayclose, :thursdayopen, :thursdayclose, :fridayopen, :fridayclose, :saturdayopen, :saturdayclose, :sundayopen, :sundayclose, :closetime, :image_url, :capacity, :cuisine, :address, :contact_number, :website, :price_range)
    end
end

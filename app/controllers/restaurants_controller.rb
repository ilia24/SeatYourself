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
        redirect_to restaurants_url

          tday = [0,0,0,0,0,0,0]
          weekday = Time.now.wday #weekday rolls from 0-6 sunday being 0
          weekvar = 0
          count = 1 #count is linked to weekday, but 1 day off so being 1-7
        while count <= 14 do
          dayadjust = 86400
          tday[weekday] = 0
          dayadjust *= count
          tday[weekday] += (dayadjust + weekvar)
          weekday += 1
          dayname = (Time.now + dayadjust).strftime("%A").downcase
          puts dayname
          Timeslot.create(@restaurant.send("#{dayname}open") + tday[weekday], @restaurant.sundayclose + wday[0], @restaurant.capacity, @restaurant.id)
          count += 1
          if weekday > 6
            weekday = 0
          end
          if count == (count % 7 == 0)
            weekvar += 604800
          end
        end
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

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

        mon = 0
        tues = 0
        weds = 0
        thurs = 0
        fri = 0
        sat = 0
        sun = 0
        wday = [mon, tues, weds, thurs, fri, sat, sun]
         if (Time.now.strftime("%u").to_i) == 7
           counter = 1
            (0..(Time.now.strftime("%u").to_i - 1)).each do |i|
              dayadjust = 86400
              dayadjust *= counter
              wdayvar = wday[i] += dayadjust
              wday[i] = wdayvar
              counter += 1
            end
         else
           counter = 1
            ((Time.now.strftime("%u").to_i)..6).each do |i|
            dayadjust = 86400
            dayadjust *= counter
            wday[i] += dayadjust
            counter += 1
          end
            (0..(Time.now.strftime("%u").to_i - 1)).each do |i|
            dayadjust = 86400
            dayadjust *= counter
            wday[i] += dayadjust
            counter += 1
          end
        end

          Timeslot.create(@restaurant.sundayopen + wday[0], @restaurant.sundayclose + wday[0], @restaurant.capacity, @restaurant.id)
          Timeslot.create(@restaurant.mondayopen + wday[1], @restaurant.mondayclose + wday[1], @restaurant.capacity, @restaurant.id)
          Timeslot.create(@restaurant.tuesdayopen + wday[2], @restaurant.tuesdayclose + wday[2], @restaurant.capacity, @restaurant.id)
          Timeslot.create(@restaurant.wednesdayopen + wday[3], @restaurant.wednesdayclose + wday[3], @restaurant.capacity, @restaurant.id)
          Timeslot.create(@restaurant.thursdayopen + wday[4], @restaurant.thursdayclose + wday[4], @restaurant.capacity, @restaurant.id)
          Timeslot.create(@restaurant.fridayopen + wday[5], @restaurant.fridayclose + wday[5], @restaurant.capacity, @restaurant.id)
          Timeslot.create(@restaurant.saturdayopen + wday[6], @restaurant.saturdayclose + wday[6], @restaurant.capacity, @restaurant.id)

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

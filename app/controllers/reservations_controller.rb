class ReservationsController < ApplicationController

  before_action :load_restaurant
  before_action :ensure_logged_in, only: [:new, :create, :edit, :destroy, :update]

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new

  end

  def create

    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user

    # if @reservation.placeholder(@reservation.start_time, @reservation.end_time, @reservation.group_size, @restaurant.id) &&  @reservation.save


       if @reservation.placeholder && @reservation.save

      redirect_to restaurant_path(@restaurant)
      flash[:notice] = 'Reservation booked successfully'
    else
      flash[:error] = 'Reservation not booked successfully'
      render :new
    # end
  end

  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation_edit = Reservation.new(reservation_params)

    # if @reservation.edit_reserve(@reservation,reservation_params[:start_time], reservation_params[:end_time], reservation_params[:group_size], @restaurant.id) && @reservation.update_attributes(reservation_params)
    if @reservation.edit_reserve(@reservation,@reservation_edit) && @reservation.update_attributes(reservation_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end

  end

  def show

  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.cancel_reserve
    @reservation.destroy
    redirect_to restaurant_path(@restaurant)

  end

  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :restaurant_id, :date, :group_size, :start_time, :end_time)
  end


  def load_restaurant
   @restaurant = Restaurant.find(params[:restaurant_id])
  end

end

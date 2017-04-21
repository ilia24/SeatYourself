class ReservationsController < ApplicationController
  before_action :load_reservation
  before_action :ensure_logged_in, only: [:new, :create, :destroy, :edit, :destroy, :update]

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = @restaurant.reservation.build(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to restaurant_path, notice: 'Reservation booked successfully'
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def updated
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(reservation_params)
      redirect_to restaurant_reservation_path
    else
      render :edit
    end

  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to restaurant_path

  end



  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :restaurant_id, :time, :date)
  end

  def load_reservation
   @product = Rerservation.find(params[:Reservation_id])
  end



end

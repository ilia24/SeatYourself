class ReservationsController < ApplicationController
  before_action :ensure_logged_in, only: [:new, :create, :destroy, :edit, :destroy, :update]
end

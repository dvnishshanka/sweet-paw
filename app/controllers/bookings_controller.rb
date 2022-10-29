class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]
  before_action :set_pet, only: [:new, :create]


  def index
    @bookings = current_user.bookings
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.pet = Pet.find(params[:pet_id])
    @booking.save
    redirect_to dashboard_path(current_user)
  end

  private

  def booking_params
    params[:booking].permit(:date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end

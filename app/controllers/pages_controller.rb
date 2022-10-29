class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @pets = Pet.all.sample(3)
    @booking = Booking.all
  end

  def dashboard
    current_user_pets
    current_user_bookings
  end

  private

  def current_user_pets
    @pets = Pet.where(user_id: current_user).all
  end

  def current_user_bookings
    @bookings = Booking.where(user_id: current_user).all
  end
end

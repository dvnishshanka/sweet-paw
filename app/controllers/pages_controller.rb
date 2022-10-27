class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @pets = Pet.all.first(4)
  end

  def dashboard
    current_user_pets
  end

  private

  def current_user_pets
    @pets = Pet.where(user_id: current_user).all
  end

  def current_user_pets
    @bookings = Booking.where(user_id: current_user).all
  end

end

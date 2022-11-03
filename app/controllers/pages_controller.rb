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

  def map
    @pets = Pet.all
    # only Pets with coordinates
    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        info_window: render_to_string(partial: "shared/info_window", locals: { pet: pet}),
        image_url: helpers.asset_url("green-paw.png")
      }
    end
  end

  private

  def current_user_pets
    @pets = Pet.where(user_id: current_user).all
  end

  def current_user_bookings
    @bookings = Booking.where(user_id: current_user).all
  end
end

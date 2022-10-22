class BookingsController < ApplicationController
  def new
  end

  def index
    @bookings = Booking.all
  end
end

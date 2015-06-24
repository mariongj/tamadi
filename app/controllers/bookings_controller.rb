class BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
     @flat = Flat.find(params[:flat_id])

  end

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = @flat.bookings.new(booking_params)
    @booking.user = current_user
    @booking.status = "pending"

    if @booking.save
      redirect_to bookings_path(current_user)
    else
      render 'flats/show'
    end
  end





private

  def booking_params
    params.require(:booking).permit(:nb_travelers, :start_date, :end_date, :message)
  end


end

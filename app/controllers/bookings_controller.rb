class BookingsController < ApplicationController
before_action :set_booking, only: [ :destroy, :update ]

  def index
    @bookings = current_user.bookings
    @my_flats = current_user.flats
    @bookings_client = []
    @my_flats.each do |flat|
      @bookings_client << flat.bookings
    end
    @bookings_client.flatten!
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

  def update
    if params[:accept] == "true"
      # Accepter le booking dans la bdd donc changer le statut
      @booking.update(status: 'confirmed')
    else
      @booking.update(status: 'refused')
    end
    redirect_to :back
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end


  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:nb_travelers, :start_date, :end_date, :message)
  end


end

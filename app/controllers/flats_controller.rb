class FlatsController < ApplicationController
  before_action :find_flat, only: [ :show, :edit, :update, :destroy, :my_flat ]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:city] && params[:capacity]
      @flats = Flat.where(city: params[:city])
        .where("capacity >= ?", params[:capacity])
    else
      @flats = Flat.all
    end
    # Let's DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end

  def show
    @booking = Booking.new
    @flats = []
    @flats << @flat
    # Let's DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = current_user.flats.build(flat_params)
    if @flat.save
      redirect_to my_flats_flats_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @flat.update(flat_params)
    redirect_to my_flats_flats_path
  end

  def destroy
    @flat.destroy
    redirect_to my_flats_flats_path
  end

  def my_flats
    @my_flats = current_user.flats
    # Let's DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@my_flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end

  def my_flat
    @flats = []
    @flats << @flat
    # Let's DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:user_id, :title, :address, :city, :description, :price_per_night, :capacity, :picture)
  end
end

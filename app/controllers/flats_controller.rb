class FlatsController < ApplicationController
  before_action :find_flat, only: [ :show, :edit, :update, :destroy ]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:city] && params[:capacity]
      @flats = Flat.where(city: params[:city])
        .where("capacity >= ?", params[:capacity])
    else
      @flats = Flat.all
    end
  end

  def show
    @booking = Booking.new
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
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:user_id, :title, :address, :city, :description, :price_per_night, :capacity)
  end
end

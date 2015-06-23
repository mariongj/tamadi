class FlatsController < ApplicationController
  before_action :find_flat, only: [ :show ]
  # , only: [ :show, :new, :create, :edit, :update, :delete, :my_flats ]
  before_action :find_user, only: [ :my_flats ]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.save
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def delete
    @flat.destroy
    redirect_to flats_path
  end

  # def my_flats
  #   @my_flats = @user.flats
  # end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def flat_params
    params.require(:flat).permit(:user_id, :title, :address, :description, :price_per_night, :capacity)
  end
end

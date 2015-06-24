class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @cities = Flat.select(:city).distinct.map { |flat| flat.city }
    @capacities = Flat.select(:capacity).distinct.map{ |flat| flat.capacity }
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @cities = Flat.select(:city).distinct.map { |flat| flat.city }
  end
end

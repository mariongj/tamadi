class Flat < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :address, presence: true
  validates :capacity, presence: true
  validates :price_per_night, presence: true

end

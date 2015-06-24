class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :bookings

  validates :title, presence: true
  validates :address, presence: true
  validates :capacity, presence: true
  validates :price_per_night, presence: true
  validates :city, presence: true

end

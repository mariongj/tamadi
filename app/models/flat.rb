class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :title, presence: true
  validates :address, presence: true
  validates :capacity, presence: true
  validates :price_per_night, presence: true
  validates :city, presence: true
  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end

class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :flat

  validates :nb_travelers, presence: true
  validates :flat, presence: true
  validates :user, presence:true
  validates :start_date, presence:true
  validates :end_date, presence:true
end

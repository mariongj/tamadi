class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :flat

  after_create :send_email

  validates :nb_travelers, presence: true
  validates :flat, presence: true
  validates :user, presence:true
  validates :start_date, presence:true
  validates :end_date, presence:true

  def send_email
    UserMailer.booking(self).deliver_now
  end
end

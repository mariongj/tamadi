class User < ActiveRecord::Base
  has_many :flats
  has_many :bookings

  #has_many :trip_flats, through: :bookings, as: :flat

  # validates :name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

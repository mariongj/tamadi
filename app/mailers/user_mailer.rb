class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user

    mail(to: @user.email, subject: "Welcome to RobertBnb")
  end

  def booking(booking)
    @owner = booking.flat.user
    @user =  booking.user
    @booking = booking

    mail(to: @owner.email, subject: "New Booking Request")
  end

end

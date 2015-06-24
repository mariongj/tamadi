# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


  # User.create!(email: "gerard@caramail.fr", encrypted_password: "hello")
  # User.create!(email: "Bob@caramail.fr", encrypted_password: "hello")
  # User.create!(email: "Gertrude@caramail.fr", encrypted_password: "hello")
  # User.create!(email: "Bernard@caramail.fr", encrypted_password: "hello")
  # User.create!(email: "Bernadette@caramail.fr", encrypted_password: "hello")
  # User.create!(email: "Milady@caramail.fr", encrypted_password: "hello")

User.destroy_all
Flat.destroy_all

  User.create!(email: 'palo@alto.com', password: '123456789', password_confirmation: '123456789')
  User.create!(email: 'gerard@caramail.fr', password: '123456789', password_confirmation: '123456789')
  User.create!(email: 'Gertrude@caramail.fr', password: '123456789', password_confirmation: '123456789')
  User.create!(email: 'Bernard@caramail.fr', password: '123456789', password_confirmation: '123456789')
  User.create!(email: 'Bernadette@caramail.fr', password: '123456789', password_confirmation: '123456789')
  User.create!(email: 'Milady@caramail.fr', password: '123456789', password_confirmation: '123456789')

 Flat.create!(title: "Maison de fou", address: "32, rue blabla", city: "Trifoullis", price_per_night: 20, capacity: 17)
 Flat.create!(title: "Gîte délabré charmant", address: "65 rue Bled", city: "Oise", price_per_night: 420, capacity: 3)
 Flat.create!(title: "Cave rurale", address: "32, rue souli", city: "Trifoullis", price_per_night: 120, capacity: 1)
 Flat.create!(title: "Maison de campagne", address: "2, ravenue des tilleuls", city: "Germines", price_per_night: 30, capacity: 7)

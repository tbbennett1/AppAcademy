# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.destroy_all
arg = Location.create!(name: "Argentina")
ny = Location.create!(name: "NY")


User.destroy_all
tommy = User.create(email: "tommy@appacademy.io", location_id: arg.id)

Bleat.destroy_all
tommy.authored_bleats.create!(body: "Hello, World!")


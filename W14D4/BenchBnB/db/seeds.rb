# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bench.destroy_all

bench1 = Bench.create(description: "benchy1", lat: 37.770682, lng: -122.389200);
bench2 = Bench.create(description: "benchy2", lat: 37.765618, lng: -122.498242);
bench3 = Bench.create(description: "benchy3", lat: 37.770970, lng: -122.446459);
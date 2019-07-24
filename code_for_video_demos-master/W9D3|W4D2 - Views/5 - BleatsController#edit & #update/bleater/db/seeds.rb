# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bleat.destroy_all
User.destroy_all
Location.destroy_all

arg = Location.create!(name: 'Argentina')
nyc = Location.create!(name: 'NYC')
sf = Location.create!(name: 'San Francisco')

tommy = arg.users.create!(email: 'tommy@appacademy.io')
mashu = arg.users.create!(email: 'mashu@appacademy.io')
brian = nyc.users.create!(email: 'brian@appacademy.io')
darren = sf.users.create!(email: 'darren@appacademy.io')
oliver = nyc.users.create!(email: 'oliver@appacademy.io')
cynthia = sf.users.create!(email: 'cynthia@appacademy.io')
david = nyc.users.create!(email: 'david@appacademy.io')
simcha = nyc.users.create!(email: 'simcha@appacademy.io')


tommy.authored_bleats.create!(body: 'You can do it!')
tommy.authored_bleats.create!(body: 'Hello, World!')

mashu.authored_bleats.create!(body: 'Hi class')
mashu.authored_bleats.create!(body: 'Totally awesome')

brian.authored_bleats.create!(body: "What we're going to do today is...")

# student.enrolled_courses
# course_ids = [1,2,3,4]
# student.enrolled_course_ids = course_ids
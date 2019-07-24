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

tommy = arg.users.create!(name: 'Tommy')
mashu = arg.users.create!(name: 'Mashu')
brian = nyc.users.create!(name: 'Brian')
darren = sf.users.create!(name: 'Darren')
oliver = nyc.users.create!(name: 'Oliver')
david = nyc.users.create!(name: 'David')
cynthia = sf.users.create!(name: 'Cynthia')

tommy.authored_bleats.create!(body: 'You can do it!')
tommy.authored_bleats.create!(body: 'Hello, World!')

mashu.authored_bleats.create!(body: 'Hi class')
mashu.authored_bleats.create!(body: 'Totally awesome')

brian.authored_bleats.create!(body: "What we're going to do today is...")



# student_ids = [1,2,3,4]
# course.enrolled_students
# course.enrolled_student_ids = student_ids


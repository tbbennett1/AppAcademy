# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

# sennacy = Cat.create!(birth_date: "02/14/1988", color: "brown", name: "Sennacy", description: "Sennacy is a very sinister kitty.")
# rb = Cat.create!(birth_date: "12/25/1925", color: "orange", name: "Ricky-Bobby", description: "Ricky-B likes to go fast!")
# marley = Cat.create!(birth_date: "04/20/1992", color: "black", name: "Marley", description: "Marley loves his catnip")

cat = Cat.create!([
    {birth_date: "1988/02/14", color: "brown", name: "Sennacy", description: "Sennacy is a very sinister kitty.", sex: "F"},
    {birth_date: "1925/12/25", color: "orange", name: "Ricky-Bobby", description: "Ricky-B likes to go fast!", sex: "M"},
    {birth_date: "1992/04/20", color: "black", name: "Marley", description: "Marley loves his catnip", sex: "M"},
])
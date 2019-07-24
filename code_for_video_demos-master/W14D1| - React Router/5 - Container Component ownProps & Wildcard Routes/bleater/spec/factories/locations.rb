FactoryBot.define do
  factory :location do
    name { Faker::Movies::StarWars.planet }
  end
end
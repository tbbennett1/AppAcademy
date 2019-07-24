FactoryBot.define do
  factory :bleat do
    body { Faker::Quotes::Shakespeare.hamlet_quote }
    association :author, factory: :user
  end
end
FactoryBot.define do
  factory :comment do
    body { "" }
    user_id { "" }
    goal_id { 1 }
  end
end

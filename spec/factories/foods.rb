FactoryBot.define do
  factory :food do
    name { Faker::Food.fruits }
    calories { Faker::Number.non_zero_digit }
  end
end

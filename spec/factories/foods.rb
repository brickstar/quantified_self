FactoryBot.define do
  factory :food do
    name { Faker::TwinPeaks.character }
    calories { Faker::Number.non_zero_digit }
  end
end

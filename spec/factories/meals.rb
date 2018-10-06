FactoryBot.define do
  factory :meal do
    food
    name { Faker::TwinPeaks.location }
  end
end

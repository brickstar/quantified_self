FactoryBot.define do
  factory :meal do
    name { Faker::TwinPeaks.location }
  end
end

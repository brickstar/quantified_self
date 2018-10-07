FactoryBot.define do
  factory :meal do
    name { Faker::TwinPeaks.location }

    trait :with_foods do
      after(:create) do |meal|
        create_list :food, 3, meals: [meal]
      end
    end
  end
end

require 'rails_helper'

describe "Meals API" do
  it "sends a list of meals" do
    meals = create_list(:meal, 3)
    foods1 = create_list(:food, 1, meal: meals[0])
    foods2 = create_list(:food, 2, meal: meals[1])
    foods3 = create_list(:food, 3, meal: meals[2])

    get '/api/v1/meals'

    expect(response).to be_successful

    meals = JSON.parse(response.body, symbolize_names: true)
    meal = meals.first

    expect(meals.count).to eq(3)
    expect(meal).to have_key(:name)
    expect(meal).to_not have_key(:created_at)
    expect(meal).to_not have_key(:updated_at)
  end
end

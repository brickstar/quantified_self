require 'rails_helper'

describe "Meals API" do
  it "sends a list of meals" do
    meals = create_list(:meal, 3)
binding.pry
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

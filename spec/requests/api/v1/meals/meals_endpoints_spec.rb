require 'rails_helper'

describe "Meals API" do
  before(:each) do
    @meals = create_list(:meal, 3, :with_foods)
  end

  it "sends a list of meals" do
    get '/api/v1/meals'

    expect(response).to be_successful

    meals = JSON.parse(response.body, symbolize_names: true)
    meal = meals.first

    expect(meals.count).to eq(3)
    expect(meal).to have_key(:name)
    expect(meal).to have_key(:foods)
    expect(meal[:foods].count).to eq(3)
    expect(meal).to_not have_key(:created_at)
    expect(meal).to_not have_key(:updated_at)
  end

  it "sends a single meal and its associated foods" do
    get "/api/v1/meals/#{@meals.first.id}/foods"

    expect(response).to be_successful

    meal = JSON.parse(response.body, symbolize_names: true)

    expect(meal).to have_key(:name)
    expect(meal).to have_key(:foods)
    expect(meal[:foods].count).to eq(3)
    expect(meal).to_not have_key(:created_at)
    expect(meal).to_not have_key(:updated_at)
  end

  it "sends a 404 if meal not found" do
    get "/api/v1/meals/100/foods"

    expect(response.status).to eq(404)
  end
end

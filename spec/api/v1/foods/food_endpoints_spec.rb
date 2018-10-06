require 'rails_helper'

describe "Foods API" do
  it "sends a list of foods" do
    create_list(:food, 3)

    get '/api/v1/foods'

    expect(response).to be_successful

    foods = JSON.parse(response.body, symbolize_names: true)
    food = foods.first

    expect(foods.count).to eq(3)
    expect(food).to have_key(:name)
    expect(food).to have_key(:calories)
    expect(food).to_not have_key(:created_at)
    expect(food).to_not have_key(:updated_at)
  end

  it "sends a single food" do
    food = create(:food)

    get "/api/v1/foods/#{food.id}"

    expect(response).to be_successful

    food = JSON.parse(response.body, symbolize_names: true)

    expect(food).to have_key(:name)
    expect(food).to have_key(:calories)
    expect(food).to_not have_key(:created_at)
    expect(food).to_not have_key(:updated_at)
  end

  it "returns 404 if record not found" do
    get "api/v1/foods/100"

    expect(response.status).to eq(404)
  end
end

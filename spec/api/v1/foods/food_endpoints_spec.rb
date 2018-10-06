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
    get "/api/v1/foods/100"

    expect(response.status).to eq(404)
  end

  it 'can create a new food' do
    name = "Mint"
    calories = "14"

    post "/api/v1/foods", params: { "food": { "name": name, "calories": calories } }

    food = JSON.parse(response.body, symbolize_names: true)

    expect(food[:id]).to eq(Food.last.id)
    expect(food[:name]).to eq(name)
    expect(food[:calories]).to eq(calories.to_i)
  end

  it 'returns 400 status if not created' do
    name = "Mint"

    post "/api/v1/foods", params: { "food": { "name": name } }

    expect(response.status).to eq(400)
  end

  it 'can update an existing food' do
    food = create(:food)

    name = "Mint"
    calories = "14"

    patch "/api/v1/foods/#{food.id}", params: { "food": { "name": name, "calories": calories } }

    food = JSON.parse(response.body, symbolize_names: true)

    expect(food[:id]).to eq(Food.last.id)
    expect(food[:name]).to eq(name)
    expect(food[:calories]).to eq(calories.to_i)
  end

  xit 'can update an existing food with only one attribute given' do
    food = create(:food)

    name = "Mint"

    patch "/api/v1/foods/#{food.id}", params: { "food": { "name": name } }

    food = JSON.parse(response.body, symbolize_names: true)

    expect(food[:id]).to eq(Food.last.id)
    expect(food[:name]).to eq(name)
  end

  it 'returns 404 status if not updated' do
    food = create(:food)

    name = 1

    patch "/api/v1/foods/#{food.id}", params: { "food": { "name": name } }

    expect(response.status).to eq(404)
  end

end

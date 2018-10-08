require 'rails_helper'


describe "Favorites endpoint" do
  before(:each) do
    @meals = create_list(:meal, 3, :with_foods)
    @food = create(:food)
  end

  it 'returns all foods for top three times eaten' do
    get '/api/v1/favorite_foods'

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
end

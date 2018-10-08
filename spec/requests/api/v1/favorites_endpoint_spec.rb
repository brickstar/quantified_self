require 'rails_helper'


describe "Favorites endpoint" do
  before(:each) do
    @meal1 = create(:meal, name: "meal1")
    @meal2 = create(:meal, name: "meal2")
    @meal3 = create(:meal, name: "meal3")
    @meal4 = create(:meal, name: "meal4")

    @food1 = create(:food, name: 'dont care 1', calories: 200)
    @food2 = create(:food, name: 'dont care 2', calories: 200)
    @food3 = create(:food, name: 'dont care 3', calories: 200)

    @food4 = create(:food, name: 'food4', calories: 200)
    @food5 = create(:food, name: 'food5', calories: 200)
    @food6 = create(:food, name: 'food6', calories: 200)

    @mealfood1 = MealFood.create!(meal_id: @meal1.id, food_id: @food1.id)

    @mealfood2 = MealFood.create!(meal_id: @meal1.id, food_id: @food2.id)
    @mealfood3 = MealFood.create!(meal_id: @meal1.id, food_id: @food2.id)

    @mealfood4 = MealFood.create!(meal_id: @meal1.id, food_id: @food3.id)
    @mealfood5 = MealFood.create!(meal_id: @meal1.id, food_id: @food3.id)
    @mealfood6 = MealFood.create!(meal_id: @meal1.id, food_id: @food3.id)

    @mealfood7 = MealFood.create!(meal_id: @meal1.id, food_id: @food4.id)
    @mealfood8 = MealFood.create!(meal_id: @meal1.id, food_id: @food4.id)
    @mealfood9 = MealFood.create!(meal_id: @meal2.id, food_id: @food4.id)
    @mealfood10 = MealFood.create!(meal_id: @meal3.id, food_id: @food4.id)

    @mealfood11 = MealFood.create!(meal_id: @meal1.id, food_id: @food5.id)
    @mealfood12 = MealFood.create!(meal_id: @meal2.id, food_id: @food5.id)
    @mealfood13 = MealFood.create!(meal_id: @meal3.id, food_id: @food5.id)
    @mealfood14 = MealFood.create!(meal_id: @meal4.id, food_id: @food5.id)
    @mealfood15 = MealFood.create!(meal_id: @meal4.id, food_id: @food5.id)

    @mealfood11 = MealFood.create!(meal_id: @meal1.id, food_id: @food6.id)
    @mealfood12 = MealFood.create!(meal_id: @meal2.id, food_id: @food6.id)
    @mealfood13 = MealFood.create!(meal_id: @meal3.id, food_id: @food6.id)
    @mealfood14 = MealFood.create!(meal_id: @meal4.id, food_id: @food6.id)
    @mealfood15 = MealFood.create!(meal_id: @meal4.id, food_id: @food6.id)
  end

  xit 'returns all foods for top three times eaten' do
    get '/api/v1/favorite_foods'

    expect(response).to be_successful

    favorite_foods = JSON.parse(response.body, symbolize_names: true)

    expect(favorite_foods).to be_a(Array)
    expect(favorite_foods.count).to eq(3)

    expect(favorite_foods[0][:timesEaten]).to eq(5)
    expect(favorite_foods[1][:timesEaten]).to eq(4)
    expect(favorite_foods[2][:timesEaten]).to eq(3)

    expect(favorite_foods[0][:foods]).to be_an(Array)
    expect(favorite_foods[0][:foods].count).to eq(2)
    expect(favorite_foods[1][:foods].count).to eq(1)
    expect(favorite_foods[2][:foods].count).to eq(1)

    expect(favorite_foods[0][:foods][0][:mealsWhenEaten]).to be_an(Array)
    expect(favorite_foods[0][:foods][0][:mealsWhenEaten]).to include(@meal4.name)
    expect(favorite_foods[0][:foods][1][:mealsWhenEaten]).to include(@meal4.name)
    expect(favorite_foods[1][:foods][0][:mealsWhenEaten]).to include(@meal3.name)
    expect(favorite_foods[2][:foods][0][:mealsWhenEaten]).to include(@meal1.name)
  end
end

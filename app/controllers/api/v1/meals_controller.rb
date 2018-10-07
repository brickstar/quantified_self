class Api::V1::MealsController < ApplicationController
  def index
    render json: Meal.all
  end

  def show
    meal = Meal.find_by(id: params[:meal_id])
    if meal
      render json: meal
    else
      render status: 404
    end
  end

  def create
    meal = Meal.find_by(id: params[:meal_id])
    food = Food.find_by(id: params[:id])
    if food && meal
      MealFood.create(meal_id: params[:meal_id], food_id: params[:id])
      render json: { "message": "Successfully added #{food.name} to #{meal.name}" }, status: 201
    else
      render status: 404
    end
  end
end

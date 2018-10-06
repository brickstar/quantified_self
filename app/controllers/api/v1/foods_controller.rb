class Api::V1::FoodsController < ApplicationController
  def index
    render json: Food.all
  end

  def show
    food = Food.find_by(id: params[:id])
    if food
      render json: Food.find(params[:id])
    else
      render status: 404
    end
  end

  def create
    food = Food.new(name: params[:food][:name], calories: params[:food][:calories])
    if food.save
      render json: food
    else
      render status: 400
    end
  end
end

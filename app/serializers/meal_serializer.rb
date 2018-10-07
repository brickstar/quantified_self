class MealSerializer < ActiveModel::Serializer
  attributes :id, :name, :foods

  def foods
    object.foods.map do |food|
      { id: food.id, name: food.name, calories: food.calories }
    end
  end
end

class FavoriteFoodsPresenter
  def favorites
    grouped_by_times_eaten.map do |times_eaten, foods|
      { timesEaten: times_eaten,
        foods: foods.map { |food| { "name": food.name, "calories": food.calories, "mealsWhenEaten": food.meals.map { |meal| meal.name }.uniq } } }
    end
  end

  private

    def grouped_by_times_eaten
      top_three_times_eaten.group_by { |food| food.times_eaten }
    end

    def top_three_times_eaten
      Food.includes(:meals)
        .where( times_eaten: Food.order(times_eaten: :desc).distinct.limit(3).pluck(:times_eaten))
        .order(times_eaten: :desc)
    end
end

meal1 = Meal.create(name: "meal1")
meal2 = Meal.create(name: "meal2")
meal3 = Meal.create(name: "meal3")
meal4 = Meal.create(name: "meal4")

food1 = Food.create(name: 'food1', calories: 200)
food2 = Food.create(name: 'food2', calories: 200)
food3 = Food.create(name: 'food3', calories: 200)
food4 = Food.create(name: 'food4', calories: 200)
food5 = Food.create(name: 'food5', calories: 200)
food6 = Food.create(name: 'food6', calories: 200)

MealFood.create(meal_id: meal1.id, food_id: food1.id)

MealFood.create(meal_id: meal1.id, food_id: food2.id)
MealFood.create(meal_id: meal1.id, food_id: food2.id)

MealFood.create(meal_id: meal1.id, food_id: food3.id)
MealFood.create(meal_id: meal1.id, food_id: food3.id)
MealFood.create(meal_id: meal1.id, food_id: food3.id)

MealFood.create(meal_id: meal1.id, food_id: food4.id)
MealFood.create(meal_id: meal1.id, food_id: food4.id)
MealFood.create(meal_id: meal2.id, food_id: food4.id)
MealFood.create(meal_id: meal3.id, food_id: food4.id)

MealFood.create(meal_id: meal1.id, food_id: food5.id)
MealFood.create(meal_id: meal2.id, food_id: food5.id)
MealFood.create(meal_id: meal3.id, food_id: food5.id)
MealFood.create(meal_id: meal4.id, food_id: food5.id)
MealFood.create(meal_id: meal4.id, food_id: food5.id)

MealFood.create(meal_id: meal1.id, food_id: food6.id)
MealFood.create(meal_id: meal2.id, food_id: food6.id)
MealFood.create(meal_id: meal3.id, food_id: food6.id)
MealFood.create(meal_id: meal4.id, food_id: food6.id)
MealFood.create(meal_id: meal4.id, food_id: food6.id)

puts "Created #{Food.count} Foods"
puts "Created #{Meal.count} Meals"
puts "Created #{MealFood.count} MealFoods"

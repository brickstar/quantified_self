meal1 = Meal.create(name: "Breakfast")
meal2 = Meal.create(name: "Lunch")
meal3 = Meal.create(name: "Dinner")
meal4 = Meal.create(name: "Snack")

food1 = Food.create(name: 'Apple', calories: 200)
food2 = Food.create(name: 'Orange', calories: 200)
food3 = Food.create(name: 'Banana', calories: 200)
food4 = Food.create(name: 'Grapes', calories: 200)
food5 = Food.create(name: 'Blueberries', calories: 200)
food6 = Food.create(name: 'Kiwi', calories: 200)

MealFood.create(meal_id: meal1.id, food_id: food1.id)

MealFood.create(meal_id: meal1.id, food_id: food2.id)
MealFood.create(meal_id: meal1.id, food_id: food2.id)

MealFood.create(meal_id: meal1.id, food_id: food3.id)
MealFood.create(meal_id: meal1.id, food_id: food3.id)
MealFood.create(meal_id: meal2.id, food_id: food3.id)

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

require_relative 'app/repositories/meal_repository'
meals_csv = 'data/meals.csv'

meal_repo = MealRepository.new(meals_csv)
p meal_repo


meal = Meal.new({ name: 'cake', price: 6 })
meal_repo.add(meal)

p meal_repo

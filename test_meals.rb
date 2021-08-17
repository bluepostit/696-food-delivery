require_relative 'app/repositories/meal_repository'
meals_csv = 'data/meals.csv'

meal_repo = MealRepository.new(meals_csv)
p meal_repo

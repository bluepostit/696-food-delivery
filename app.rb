require_relative 'router'
require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/meal_repository'

meals_csv_path = File.join(__dir__, 'data/meals.csv')
meal_repository = MealRepository.new(meals_csv_path)
meals_controller = MealsController.new(meal_repository)

router = Router.new(meals_controller)
router.run

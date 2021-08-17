require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    # get meals from repo
    # display them in the view
    meals = @meal_repository.all
    @view.display(meals)
  end

  def create
    # ask user for meal name
    # ask user for meal price
    name = @view.ask_user_for('meal name')
    price = @view.ask_user_for('meal price')
    meal = Meal.new(name: name, price: price)
    @meal_repository.add(meal)
  end
end

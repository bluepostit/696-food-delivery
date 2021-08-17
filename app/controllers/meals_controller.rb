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
end

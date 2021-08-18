require_relative '../views/orders_view'
require_relative '../views/meals_view'
require_relative '../views/customers_view'

class OrdersController
  def initialize(meal_repository,
                 customer_repository,
                 employee_repository,
                 order_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @view = OrdersView.new
  end

  def list_undelivered
    # get all undelivered orders from repo
    # display them in the view
    orders = @order_repository.undelivered_orders
    @view.display(orders)
  end

  def list_my_undelivered(employee)
    # get all undelivered orders FOR THIS EMPLOYEE from repo
    # display them in the view
    orders = employee.undelivered_orders
    @view.display(orders)
  end

  def create
    # display all meals
    # ask user for the meal
    # display all customers
    # ask user for the customer
    # display all riders
    # ask user for the rider (employee)
    # create
    # add to repository

    meal = ask_for_meal
    customer = ask_for_customer
    rider = ask_for_rider
    order = Order.new(
      meal: meal,
      customer: customer,
      employee: rider
    )
    @order_repository.create(order)
  end

  private

  def ask_for_meal
    meals = @meal_repository.all
    MealsView.new.display(meals)
    meal_index = @view.ask_user_for_index
    meals[meal_index]
  end

  def ask_for_customer
    customers = @customer_repository.all
    CustomersView.new.display(customers)
    customer_index = @view.ask_user_for_index
    customers[customer_index]
  end

  def ask_for_rider
    riders = @employee_repository.riders
    @view.display_riders(riders)
    index = @view.ask_user_for_index
    riders[index]
  end
end

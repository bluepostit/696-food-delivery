require_relative 'app/repositories/order_repository'
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/employee_repository'

meals_csv_path = File.join(__dir__, 'data/meals.csv')
meal_repository = MealRepository.new(meals_csv_path)
customers_csv_path = File.join(__dir__, 'data/customers.csv')
customer_repository = CustomerRepository.new(customers_csv_path)
employees_csv_path = File.join(__dir__, 'data/employees.csv')
employee_repository = EmployeeRepository.new(employees_csv_path)


csv_path = 'data/orders.csv'
repo = OrderRepository.new(csv_path,
                           meal_repository,
                           customer_repository,
                           employee_repository)

p repo.undelivered_orders

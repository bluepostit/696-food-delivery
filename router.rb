# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      display_menu
      action = user_action
      print `clear`
      dispatch(action)
    end
    puts "Bye!"
  end

  private

  def user_action
    puts 'Please enter your choice: '
    print '> '
    gets.chomp.to_i
  end

  def dispatch(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.create
    when 3 then @customers_controller.list
    when 4 then @customers_controller.create
    when 0 then stop
    end
  end

  def stop
    @running = false
  end

  def display_menu
    puts "\n --- Food Delivery ---"
    puts "-------------------------"
    puts '1. List all meals'
    puts '2. Add a meal'
    puts '3. List all customers'
    puts '4. Add a customer'
    puts '0. Exit'
  end
end

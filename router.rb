class Router
  def initialize(meals_controller,
                 customers_controller,
                 sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running
      # Log in! Returns an Employee instance...
      @employee = sign_in
      while @employee # loop as long as @employee is not false/nil
        display_menu
        action = user_action
        print `clear`
        dispatch_action(action)
      end
    end
    puts "Bye!"
  end

  private

  def sign_in
    @sessions_controller.sign_in
  end

  def user_action
    puts 'Please enter your choice: '
    print '> '
    gets.chomp.to_i
  end

  def dispatch_action(action)
    if @employee.manager?
      dispatch_manager_action(action)
    else
      dispatch_rider_action(action)
    end
  end

  def dispatch_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.create
    when 3 then @customers_controller.list
    when 4 then @customers_controller.create
    when 9 then sign_out
    when 0 then stop
    end
  end

  def dispatch_rider_action(action)
    case action
    when 1 then puts 'To do...'
    when 2 then puts 'To do...'
    when 9 then sign_out
    when 0 then stop
    end
  end

  def stop
    sign_out
    @running = false
  end

  def sign_out
    @employee = nil
  end

  def display_menu
    if @employee.manager?
      display_manager_menu
    else
      display_rider_menu
    end
  end

  def display_manager_menu
    puts "\n --- Food Delivery ---"
    puts "-------------------------"
    puts '1. List all meals'
    puts '2. Add a meal'
    puts '3. List all customers'
    puts '4. Add a customer'
    puts '9. Sign out'
    puts '0. Exit'
  end

  def display_rider_menu
    puts "\n --- Food Delivery ---"
    puts "-------------------------"
    puts '1. List my orders'
    puts '2. Deliver an order'
    puts '9. Sign out'
    puts '0. Exit'
  end
end

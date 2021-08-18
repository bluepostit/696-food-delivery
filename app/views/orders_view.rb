class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order.meal.name} ➡️ #{order.customer.address} - #{order.employee.username} #{order.delivered?}"
    end
  end

  def ask_user_for(item)
    puts "Please enter the #{item}"
    print '> '
    gets.chomp
  end

  def display_riders(riders)
    riders.each_with_index do |rider, index|
      puts "#{index + 1}. #{rider.username}"
    end
  end

  def ask_user_for_index
    ask_user_for('number').to_i - 1
  end
end

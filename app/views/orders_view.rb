class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order.meal.name} ➡️ #{order.customer.address} - #{order.employee.username}"
    end
  end
end

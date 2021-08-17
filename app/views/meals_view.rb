class MealsView
  def display(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name} $#{meal.price}"
    end
  end

  def ask_user_for(item)
    puts "Please enter the #{item}"
    print '> '
    gets.chomp
  end

  def ask_user_for_price
    ask_user_for('meal price').to_i
  end
end

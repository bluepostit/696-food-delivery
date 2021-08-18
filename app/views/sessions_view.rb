class SessionsView
  def ask_user_for(item)
    puts "Please enter your #{item}:"
    print '> '
    gets.chomp
  end

  def incorrect_password
    puts "Please check your password and try again"
  end

  def incorrect_login
    puts "Login unsuccessful. Please try again"
  end
end

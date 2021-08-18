require_relative '../views/sessions_view'

class SessionsController
  # State
  # - employee repository

  # Behavior
  # - sign in

  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def sign_in
    # ask user for username
    # ask user for password
    # look for an Employee instance that matches these credentials
    # if there is a match - ?
    # if not - ?
    username = @view.ask_user_for('user name')
    password = @view.ask_user_for('password')

    # find an employee with this username
    # if found, check if the passwords match
    # if matching, successful sign in!
    # if not, failed sign in

    employee = @employee_repository.find_by_username(username)
    if employee
      if employee.password == password
        return employee
      else
        @view.incorrect_password
        sign_in
      end
    else
      @view.incorrect_login
      sign_in
    end
  end
end

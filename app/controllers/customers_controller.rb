require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def list
    # get customers from repo
    # display them in the view
    customers = @customer_repository.all
    @view.display(customers)
  end

  def create
    # ask user for customer name
    # ask user for customer address
    name = @view.ask_user_for('customer name')
    address = @view.ask_user_for('customer address')
    customer = Customer.new(name: name, address: address)
    @customer_repository.add(customer)
  end
end

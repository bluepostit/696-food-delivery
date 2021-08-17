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
end

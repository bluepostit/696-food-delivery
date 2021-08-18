require_relative '../views/orders_view'

class OrdersController
  def initialize(order_repository)
    @order_repository = order_repository
    @view = OrdersView.new
  end

  def list_undelivered
    # get all undelivered orders from repo
    # display them in the view
    orders = @order_repository.undelivered_orders
    @view.display(orders)
  end
end

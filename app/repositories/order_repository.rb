require 'csv'
require_relative '../models/order'

class OrderRepository
  # State
  # - collection of items
  # - CSV file path

  def initialize(csv_file_path,
                 meal_repository,
                 customer_repository,
                 employee_repository)
    @csv_file_path = csv_file_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
    @next_id = 1
    load_csv if File.exist?(csv_file_path)
  end

  def all
    @orders
  end

  def create(order)
    order.id = @next_id
    @next_id += 1
    @orders << order
    store_csv
  end

  def find(id)
    @orders.find { |order| order.id == id }
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == 'true'
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      order = Order.new(row)
      @orders << order
    end
    @next_id = @orders.max { |order| order.id }.id + 1 unless @orders.empty?
  end

  def store_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << %w[id meal_id customer_id employee_id delivered]
      @orders.each do |order|
        csv << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered?]
      end
    end
  end
end

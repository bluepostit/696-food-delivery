require 'csv'
require_relative '../models/customer'

class CustomerRepository
  # State
  # - collection of items
  # - CSV file path

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @customers = []
    @next_id = 1
    load_csv if File.exist?(csv_file_path)
  end

  def all
    @customers
  end

  def add(customer)
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    store_csv
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      customer = Customer.new(row)
      @customers << customer
    end
    @next_id = @customers.last.id + 1 unless @customers.empty?
  end

  def store_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << %w[id name address]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end

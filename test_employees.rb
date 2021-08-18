require_relative 'app/repositories/employee_repository'

csv_file_path = File.join(__dir__, 'data/employees.csv')
repo = EmployeeRepository.new(csv_file_path)

p repo

puts "There are #{repo.all.count} employees"

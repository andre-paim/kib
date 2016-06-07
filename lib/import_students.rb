require 'csv'

input_file = Rails.root.join('lib/students.csv')

CSV.foreach(input_file) do |row|
  students = Student.new
  students.user_id = row[0]
  students.course_id = row[1]
  students.active = row[2]
  students.save

end

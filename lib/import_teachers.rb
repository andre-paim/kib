require 'csv'

input_file = Rails.root.join('lib/teachers.csv')

CSV.foreach(input_file) do |row|
  teacher = Teacher.new
  teacher.user_id = row[0]
  teacher.course_id = row[1]
  teacher.active = row[2]
  teacher.save

end

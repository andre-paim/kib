require 'csv'

input_file = Rails.root.join('lib/courses.csv')

CSV.foreach(input_file) do |row|
  course = Course.new
  course.name = row[0]
  course.subject = row[1]
  course.kellogg_code = row[2]
  course.save

end

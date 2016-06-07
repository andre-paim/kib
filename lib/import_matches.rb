require 'csv'

input_file = Rails.root.join('lib/matches.csv')

CSV.foreach(input_file) do |row|
  matching = Matching.new
  matching.class_ref = row[0]
  matching.teacher_id = row[1]
  matching.student_id = row[2]
  matching.course_id = row[3]
  matching.duration = row[4]
  matching.date_status = row[5]
  matching.status = row[6]
  matching.date_scheduled = row[7]
  matching.teacher_was_present = row[8]
  matching.student_was_present = row[9]
  matching.rating_teacher = row[10]
  matching.rating_student = row[11]
  matching.save

end

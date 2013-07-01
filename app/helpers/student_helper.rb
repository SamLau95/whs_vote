module StudentHelper
  def name_of_student(id)
    s = Student.find_by_id id
    s.name
  end
end

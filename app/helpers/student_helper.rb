module StudentHelper
  def name_of_student(id)
    s = Student.find_by_id id
    s.name
  end

  def category_name(id)
  	s = Candidate.find_by_id id
  	s.category.name
  end
end

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string(255)
#  grade      :integer
#

class GradeCategory < Category
	attr_accessible :grade
	validates :grade, presence: true

	def self.categories_for(student)
		where "grade = #{student.grade}" || []
	end
end

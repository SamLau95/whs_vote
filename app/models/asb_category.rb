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

class AsbCategory < Category
	def self.categories_for(student)
		(all unless student.grade < 9) || []
	end
end

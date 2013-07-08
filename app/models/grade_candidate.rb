# == Schema Information
#
# Table name: students
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  s_id           :integer
#  birthdate      :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  grade          :integer
#  remember_token :string(255)
#  admin          :boolean          default(FALSE)
#  type           :string(255)
#  desc           :text
#  category_id    :integer
#

class GradeCandidate < Candidate
end

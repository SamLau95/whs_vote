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
#

class Candidate < Student
  has_many :reverse_votes, foreign_key: 'cand_id', 
                           class_name: 'Vote', dependent: :destroy
  has_many :voters, through: :reverse_votes, source: :voter

end

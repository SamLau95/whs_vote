# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  student_id :integer
#  desc       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Profile < ActiveRecord::Base
  attr_accessible :desc
  belongs_to :student 

  validates :desc, presence: true
end

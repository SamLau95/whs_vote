# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  voter_id   :integer
#  cand_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vote < ActiveRecord::Base
  attr_accessible :cand_id

  belongs_to :voter, class_name: 'Student'
  belongs_to :cand,  class_name: 'Student'
end

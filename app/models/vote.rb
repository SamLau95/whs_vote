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
end

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

require 'spec_helper'

describe Vote do
  pending "add some examples to (or delete) #{__FILE__}"
end
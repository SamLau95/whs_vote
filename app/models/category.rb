# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  candidate_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :candidates
end

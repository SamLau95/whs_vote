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

class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :candidates

  validates :name, presence: true

  def self.categories_for(student)
  	raise "Not implemented"
  end
end

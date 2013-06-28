# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  s_id       :integer
#  birthdate  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  grade      :integer
#

class Student < ActiveRecord::Base
  attr_accessible :name, :s_id, :birthdate, :grade

  validates :name,  presence: true, length: { maximum: 50 }
  validates :s_id,  presence: true, uniqueness: true
  validates :grade, presence: true
  validates_each :birthdate, presence: true do |record, attr, value|
    begin
      Date.strptime(value, '%m/%d/%Y')
    rescue ArgumentError => e
      record.errors.add(attr, "was invalid")
    end
  end

end
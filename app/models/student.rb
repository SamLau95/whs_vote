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
#

class BirthdateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    begin
      Date.strptime(value, '%m/%d/%Y')
    rescue ArgumentError => e
      record.errors.add(attribute, "was invalid")
    end
  end
end

class Student < ActiveRecord::Base
  include ActiveModel::Validations
  attr_accessible :name, :s_id, :birthdate, :grade

  validates :name,  presence: true, length: { maximum: 50 }
  validates :s_id,  presence: true, uniqueness: true
  validates :grade, presence: true
  validates :birthdate, presence: true, birthdate: true

  has_many :votes, foreign_key: 'voter_id', dependent: :destroy

  before_save :create_remember_token

  self.per_page = 50

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end

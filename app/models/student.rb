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
#  category       :integer
#

class ValidBirthdateValidator < ActiveModel::EachValidator
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
  attr_accessible :name, :s_id, :birthdate, :grade, :category

  validates :name,  presence: true, length: { maximum: 50 }
  validates :s_id,  presence: true, uniqueness: true
  validates :grade, presence: true
  validates :birthdate, presence: true, valid_birthdate: true

  has_many :votes, foreign_key: 'voter_id', dependent: :destroy
  has_many :candidates_voting_for, through: :votes, source: :cand
  has_many :reverse_votes, foreign_key: 'cand_id', 
                           class_name: 'Vote', dependent: :destroy
  has_many :voters, through: :reverse_votes, source: :voter
  has_one  :profile, dependent: :destroy

  before_save :create_remember_token, :set_default_category
  
  self.per_page = 50

  def voting_for?(candidate)
    votes.find_by_cand_id candidate.id
  end

  def vote_for!(candidate)
    votes.create! cand_id: candidate.id
  end

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    def set_default_category
      self.category ||= 0
    end

end

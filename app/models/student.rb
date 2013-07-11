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
#  category_id    :integer
#

# Makes sure birthdates are valid using Date#strptime
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
  attr_accessible :name, :s_id, :birthdate, :grade

  validates :name,      presence: true, length: { maximum: 50 }
  validates :s_id,      presence: true, uniqueness: true
  validates :grade,     presence: true
  validates :birthdate, presence: true, valid_birthdate: true

  # A student can only vote for candidates and can't be voted for
  has_many :votes, foreign_key: 'voter_id', dependent: :destroy
  has_many :candidates_voting_for, through: :votes, source: :cand

  before_save :create_remember_token
  
  # per_page students shown for every page using will_paginate
  self.per_page = 40

  def voting_for?(candidate)
    votes.find_by_cand_id candidate.id
  end

  def vote_for!(candidate)
    votes.create! cand_id: candidate.id
  end

  # Allow child classes to use parent routes
  def self.inherited(child)
    child.instance_eval do
      alias :original_model_name :model_name
      def model_name
        Student.model_name
      end
    end
    super
  end

  private
    # Used to keep track of logged in user
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end

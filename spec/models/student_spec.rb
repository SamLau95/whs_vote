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

require 'spec_helper'

describe Student do
  let(:student) { Student.new name: 'Test', s_id: 1234, 
                              grade: 12, birthdate: '1/1/2000' }

  subject { student }

  it { should respond_to :name }
  it { should respond_to :s_id }
  it { should respond_to :grade }
  it { should respond_to :birthdate }
  it { should respond_to :remember_token }
  it { should respond_to :admin }
  it { should respond_to :type }
  it { should respond_to :votes }
  it { should respond_to :candidates_voting_for }
  it { should respond_to :voting_for? }
  it { should respond_to :vote_for! }

  it { should be_valid }
  it { should_not be_admin }

  describe 'when name is not present' do
    before { student.name = ' ' }
    it { should_not be_valid }
  end

  describe 'when name is too long' do
    before { student.name = 'a' * 51 }
    it { should_not be_valid }
  end

  describe 'when s_id is not present' do
    before { student.s_id = nil }
    it { should_not be_valid }
  end

  describe 'when s_id is already taken' do
    before do
      dup_id_student = student.dup
      dup_id_student.save
    end
    it { should_not be_valid }
  end

  describe 'when birthdate is not present' do
    before { student.birthdate = ' ' }
    it { should_not be_valid }
  end

  describe 'when birthdate is not valid' do
    it 'should be invalid' do
      birthdates = %w[02/30/2013 6/31/2013 8/32/1995 12-5-2000]
      birthdates.each do |invalid_bdate|
        student.birthdate = invalid_bdate
        student.should_not be_valid
      end
    end
  end

  describe 'when birthdate is valid' do
    it 'should be valid' do
      birthdates = %w[9/17/1995 2/29/2012 01/01/2000 6/02/2002]
      birthdates.each do |valid_bdate|
        student.birthdate = valid_bdate
        student.should be_valid
      end
    end
  end

  describe 'remember token' do
    before { student.save }
    its(:remember_token) { should_not be_blank }
  end

  describe 'with admin attribute set to true' do
    before do
      student.save!
      student.toggle! :admin
    end
    it { should be_admin }
  end

  describe 'voting' do
    let(:candidate) { FactoryGirl.create :candidate }
    before do
      student.save
      student.vote_for! candidate
    end

    it { should be_voting_for candidate }
    its(:candidates_voting_for) { should include candidate }
  end  

  describe 'vote association' do
    before { student.save }
    let(:cand) { FactoryGirl.create :candidate }
    let!(:vote) { student.vote_for! cand }

    it 'should destroy the associated votes' do
      votes = student.votes.dup
      student.destroy
      votes.should_not be_empty
      votes.each do |vote|
        Vote.find_by_id(vote.id).should be_nil
      end
    end
  end

end

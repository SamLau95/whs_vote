# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  student_id :integer
#  desc       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Profile do
  let(:candidate) { FactoryGirl.create :candidate }
  let(:profile) { candidate.build_profile desc: 'Lorem ipsum' }

  subject { profile }

  it { should be_valid }

  describe 'accessible attributes' do
    it 'should not allow access to candidate id' do
      expect do
        Profile.new student_id: candidate.id
      end.to raise_error ActiveModel::MassAssignmentSecurity::Error
    end
  end

  describe 'profile/candidate methods' do
    it { should respond_to :student }
    its(:student) { should == candidate }
  end

  describe 'when description is not present' do
    before { profile.desc = ' ' }
    it { should_not be_valid }
  end
end

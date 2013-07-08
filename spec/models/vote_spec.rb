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
  let(:voter) { FactoryGirl.create :student }
  let(:cand) { FactoryGirl.create :candidate }
  let(:vote) { voter.votes.build cand_id: cand.id }

  subject { vote }

  it { should be_valid }

  describe 'accessible attributes' do
    it 'should not allow access to voter id' do
      expect do
        Vote.new voter_id: voter.id
      end.to raise_error ActiveModel::MassAssignmentSecurity::Error
    end
  end

  describe 'voter/cand methods' do
    it { should respond_to :voter }
    it { should respond_to :cand }
    its(:voter) { should == voter }
    its(:cand) { should == cand }
  end

  describe 'when voter id is not present' do
    before { vote.voter_id = nil }
    it { should_not be_valid }
  end

  describe 'when cand id is not present' do
    before { vote.cand_id = nil }
    it { should_not be_valid }
  end
end

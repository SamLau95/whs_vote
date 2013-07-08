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
#

require 'spec_helper'

# Candidates can vote, be voted for, and have a description/profile page
describe Candidate do
  let(:cand) { FactoryGirl.create :candidate }
  subject { cand }

  its(:type) { should eq 'Candidate' }
  it { should respond_to :desc }
  it { should respond_to :reverse_votes }
  it { should respond_to :voters }
  it { should be_valid }
end

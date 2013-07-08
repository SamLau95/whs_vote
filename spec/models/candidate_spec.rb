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

describe Candidate do
  let(:category) { FactoryGirl.create :category }
  let(:cand) { FactoryGirl.create :candidate, category: category }
  subject { cand }

  it { should respond_to :desc }
  it { should respond_to :reverse_votes }
  it { should respond_to :voters }
  it { should respond_to :category }
  it { should respond_to :category_id }

  it { should be_valid }

  its(:category_id) { should == category.id }

  describe 'without category id' do
    before { cand.category_id = nil }
    it { should_not be_valid }
  end
end

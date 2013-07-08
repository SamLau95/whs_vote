# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  candidate_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Category do
  let(:category) { FactoryGirl.create :category }

  subject { category }

  it { should respond_to :name }
  it { should respond_to :candidates }
  
end

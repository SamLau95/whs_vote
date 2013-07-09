# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string(255)
#  grade      :integer
#

require 'spec_helper'

describe Category do
  let(:category) { FactoryGirl.create :category }

  subject { category }

  it { should respond_to :name }
  it { should respond_to :candidates }
  
  describe 'without name' do
    before { category.name = nil }
    it { should_not be_valid }
  end

  describe 'Grade Category' do
  	let(:g_category) { GradeCategory.create name: '12th grade', grade: 12 }
  	subject { g_category }

  	it { should be_valid }

  	describe 'without grade' do
  		before { g_category.grade = nil }
  		it { should_not be_valid }
  	end
  end
end

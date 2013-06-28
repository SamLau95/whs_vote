require 'spec_helper'

describe "StudentPages" do
  
  subject { page }

  describe 'create page' do
    before { visit create_path }

    it { should have_h1 'Create Student' }
    it { should have_title full_title('Create Student') }
  end

  describe 'show page' do
    let(:student) { FactoryGirl.create :student }
    before { visit student_path student }

    it { should have_h1    student.name }
    it { should have_title student.name }
  end
end

require 'spec_helper'

describe "StudentPages" do
  
  subject { page }

  describe 'student creation' do
    before { visit create_path }
    let(:submit) { 'Create' }

    it { should have_h1 'Create Student' }
    it { should have_title full_title('Create Student') }

    describe 'with invalid information' do
      it 'should not create a student' do
        expect { click_button submit }.not_to change(Student, :count)
      end
    end

    describe 'with valid information' do
      before do
        fill_in 'Name', with: 'Student 1'
        fill_in 'Student ID', with: 123456
        fill_in 'Grade', with: 12
        fill_in 'Birthdate', with: '1/1/1995'
      end
      it 'should create a user' do
        expect { click_button submit }.to change(Student, :count).by(1)
      end
    end
  end

  describe 'show page' do
    let(:student) { FactoryGirl.create :student }
    before { visit student_path student }

    it { should have_h1    student.name }
    it { should have_title student.name }
  end
end

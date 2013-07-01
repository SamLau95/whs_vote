require 'spec_helper'

describe "StudentPages" do
  
  subject { page }

  describe 'student creation' do
    let(:admin) { FactoryGirl.create :admin }
    before do
      sign_in admin
      visit create_path
    end
    let(:submit) { 'Create' }

    it { should have_h1 'Create Student' }
    it { should have_title full_title('Create Student') }

    describe 'with invalid information' do
      it 'should not create a student' do
        expect { click_button submit }.not_to change(Student, :count)
      end
      describe 'after submission' do
        before { click_button submit }

        it { should have_title('Create Student') }
        it { should have_content('error') }
      end
    end

    describe 'with valid information' do
      before { fill_in_valid_student_info }

      it 'should create a student' do
        expect { click_button submit }.to change(Student, :count).by(1)
      end
      
      describe 'after saving the student' do
        before { click_button submit }
        let(:student) { Student.find_by_s_id 123456 }

        it { should have_title(student.name) }
        it { should have_success_message('Student created!') }
        it { should have_link 'Sign Out' }
      end
    end
  end

  describe 'index page' do
    let(:admin)    { FactoryGirl.create :admin }
    let!(:student) { FactoryGirl.create :student }

    before do
      sign_in admin
      visit students_path
    end

    it { should have_title 'All Students' }
    it { should have_h1    'All Students' }

    describe 'delete links' do
      it { should have_link admin.s_id.to_s }
      it { should have_link student.s_id.to_s }
      it { should have_link 'delete', href: student_path(student) }  

      it 'should be able to delete another user' do
        expect { click_link 'delete' }.to change(Student, :count).by(-1)
      end
    end

    describe 'pagination' do
      before(:all) { 50.times { FactoryGirl.create :student } }
      after(:all)  { Student.delete_all }

      it { should have_selector('div.pagination') }
      it 'should list each user' do
        Student.paginate(page: 1).each do |st|
          page.should have_selector('li', text: st.s_id.to_s)
        end
      end
    end
  end

  describe 'show page' do
    let!(:student) { FactoryGirl.create :student }
    let!(:other) { FactoryGirl.create :student }
    let!(:c1) { FactoryGirl.create :candidate }
    let!(:c2) { FactoryGirl.create :candidate }

    before do
      student.votes.create cand_id: c1.id
      other.votes.create cand_id: c2.id
    end

    describe 'as a voter' do
      before do
        sign_in student
      end

      describe 'can see own votes' do
        it { should have_h1    student.name }
        it { should have_title student.name }
        it { should have_content 'voted!' }
        it { should have_content c1.name }
      end

      describe 'cannot see other votes' do
        before { visit student_path other }
        it { should_not have_title other.name }
        it { should_not have_content c2.name }
      end
    end

    describe 'as an admin' do
      let(:admin) { FactoryGirl.create :admin }
      before do
        sign_in admin
        visit student_path student
      end

      describe 'should be able to see other votes' do
        it { should have_content 'voted!' }
        it { should have_content c1.name }
      end
    end

  end
end

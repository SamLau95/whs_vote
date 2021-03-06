require 'spec_helper'

describe 'Authentication' do
  subject { page }

  describe 'signin path' do
    before { visit signin_path }
    it { should have_h1 'Sign In' }
    it { should have_title 'Sign In' }
  end

  describe 'signin' do
    before { visit signin_path }

    describe 'with invalid info' do
      before { click_button 'Sign In' }
      it { should have_title 'Sign In' }
      it { should have_error_message 'Wrong' }

      describe 'after visiting another page' do
        before { click_link 'Home' }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe 'with valid info' do
      let(:student) { FactoryGirl.create(:student) }
      before { valid_signin student }

      it { should have_title student.name }
      it { should have_link student.name, href: student_path(student) }
      it { should have_link 'Sign Out', href: signout_path }
      it { should_not have_link 'Sign In', href: signin_path }

      describe 'signin page redirect' do
        before { visit signin_path }
        it { should have_title student.name }
      end

      describe 'home page redirect' do
        before { visit root_path }
        it { should have_title student.name }
      end

      describe 'followed by a signout' do
        before { click_link 'Sign Out' }
        it { should have_title 'Home' }
        it { should have_link 'Sign In' }
      end
    end
  end

  describe 'authorization' do
    describe 'for not signed in users' do
      let(:student) { FactoryGirl.create :student }

      describe 'in the student controller' do
        describe 'visiting the profile page' do
          before { visit student_path student }
          it { should have_title 'Sign In' }
        end

        describe 'visiting the index page' do
          before { visit students_path }
          it { should have_title 'Home' }
        end
      end

      describe 'in the vote controller' do
        describe 'submitting to the create action' do
          before { post votes_path }
          specify { response.should redirect_to signin_path }
        end
      end
    end

    describe 'as wrong user' do
      let(:student) { FactoryGirl.create :student }
      let(:wrong_student) { FactoryGirl.create :student, s_id: 123 }
      before { sign_in student }

      describe 'visiting Students#show' do
        before { visit student_path wrong_student }
        it { should_not have_title wrong_student.name }
      end
    end

    describe 'as non_admin user' do
      let(:student) { FactoryGirl.create :student }
      let(:non_admin) { FactoryGirl.create :student }

      before { sign_in non_admin }

      describe 'visiting the index page' do
        before { visit students_path }
        it { should have_title non_admin.name }
      end

      describe 'submitting a DELETE request to Students#destroy' do
        before { delete student_path student }
        specify { response.should redirect_to root_path }
      end

      describe 'visiting the student create page' do
        before { visit create_path }
        it { should have_title non_admin.name }
      end
    end

    describe 'as admin user' do
      let(:admin) { FactoryGirl.create(:admin) }
      before { sign_in admin }

      it { should have_link 'Students', href: students_path }

      describe 'submitting a DELETE request to itself' do
        before { delete student_path admin }
        specify { response.should redirect_to root_path }
      end
    end

    describe 'when attempting to visit a protected page' do
      let(:student) { FactoryGirl.create :student }
      before { sign_in student }

      describe 'after signing in' do
        it 'should render the desired protected page' do
          page.should have_title student.name
        end
      end  

      describe "when signing in again" do
        before do
          click_link 'Sign Out'
          sign_in student
        end

        it "should render the default (profile) page" do
          page.should have_title student.name
        end
      end
    end
  end
end

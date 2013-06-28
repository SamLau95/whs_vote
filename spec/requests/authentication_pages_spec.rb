require 'spec_helper'

describe "Authentication" do
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
      it { should have_link 'Vote', href: student_path(student) }
      it { should have_link 'Sign Out', href: signout_path }
      it { should_not have_link 'Sign In', href: signin_path }
    end
  end
end

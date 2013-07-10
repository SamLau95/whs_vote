require 'spec_helper'

describe "VotePages" do
  subject { page }

  let(:student)           { FactoryGirl.create :student, grade: 12 }
  let(:asb_cat)           { FactoryGirl.create :asb_category }
  let!(:asb_cand)         { FactoryGirl.create :candidate, category: asb_cat, category_id: asb_cat.id }
  let(:sen_grade_cat)     { FactoryGirl.create :grade_category, grade: 12 }
  let!(:sen_grade_cand)   { FactoryGirl.create :candidate, category: sen_grade_cat, category_id: sen_grade_cat.id }
  let(:fresh_grade_cat)   { FactoryGirl.create :grade_category, grade: 9 }
  let!(:fresh_grade_cand) { FactoryGirl.create :candidate, category: fresh_grade_cat, category_id: fresh_grade_cat.id }

  describe 'vote creation' do
    describe 'showing candidates' do
      describe 'student in 12th grade' do
        before { sign_in student }
        it { should have_content asb_cand.name }
        it { should have_content sen_grade_cand.name }
        it { should_not have_content fresh_grade_cand.name }
      end

      describe 'student in 9th grade' do
        before do
          student.update_attributes grade: 9
          sign_in student
        end
        it { should have_content asb_cand.name }
        it { should have_content fresh_grade_cand.name }
        it { should_not have_content sen_grade_cand.name }
      end

      describe 'student in 7th grade' do
        before do
          student.update_attributes grade: 7
          sign_in student
        end
        it { should_not have_content asb_cand.name }
        it { should_not have_content sen_grade_cand.name }
        it { should_not have_content fresh_grade_cand.name }
      end
    end

    describe 'with no choices' do
      before { sign_in student }

      it 'should not create any votes' do
        expect { click_button 'Vote!' }.not_to change(Vote, :count)
      end

      describe 'error messages' do
        before { click_button 'Vote!' }
        it { should have_error_message 'didn\'t select any candidates' }
      end
    end

    describe 'with choices' do
      before do 
        sign_in student
        choose asb_cand.name
        choose sen_grade_cand.name
      end
      it 'should create votes' do
        expect { click_button 'Vote!' }.to change(Vote, :count).by(2)
      end
    end
  end
end

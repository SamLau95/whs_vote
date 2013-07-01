require 'spec_helper'

describe "VotePages" do
  pending 'To be implemented after VoteCategory' do
    subject { page }

    let(:student) { FactoryGirl.create :student }
    before { sign_in student }

    describe 'vote creation' do
      describe 'with invalid choices' do
        it 'should not create any votes' do
          expect { click_button 'Vote!' }.not_to change(Vote, :count)
        end

        describe 'error messages' do
          before { click_button 'Vote!' }
          it { should have_error_message 'didn\'t select any candidates' }
        end
      end
    end
  end
end

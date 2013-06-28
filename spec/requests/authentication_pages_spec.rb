require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe 'signin path' do
    before { visit signin_path }
    it { should have_h1 'Sign In' }
    it { should have_title 'Sign In' }
  end
end

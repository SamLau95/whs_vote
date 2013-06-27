# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  s_id       :integer
#  birthdate  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Student do
  before do
    @student = Student.new name: 'Example', s_id: 123456, birthdate: '01011969'
  end

  subject { @student }
  it { should respond_to :name }
  it { should respond_to :s_id }
  it { should respond_to :birthdate }

  it { should be_valid }

  describe 'when name is not present' do
    before { @student.name = ' ' }
    it { should_not be_valid }
  end

end

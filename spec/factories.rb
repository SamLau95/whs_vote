FactoryGirl.define do
  factory :student do
    sequence(:name) { |n| "Student #{n}" }
    sequence(:s_id) { |n| 300000 + n }
    grade 12
    birthdate '1/1/1995'

    factory :admin do
      admin true
    end

    factory :candidate do
      candidate :true
    end
  end

  factory :vote do
    content 'Lorem ipsum'
    student
  end
end
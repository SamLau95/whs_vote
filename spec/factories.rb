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
      sequence(:category) { |n| n % 4 + 1 }
    end
  end
end
FactoryGirl.define do
  factory :student do
    sequence(:name) { |n| "Student #{n}" }
    sequence(:s_id) { |n| 300000 + n }
    grade 12
    birthdate '1/1/1995'

    factory :admin do
      admin true
    end
  end

  factory :candidate do
    sequence(:name) { |n| "Candidate #{n}" }
    sequence(:s_id) { |n| 200000 + n }
    grade 12
    birthdate '1/1/1995'
    category
  end

  factory :category do
    sequence(:name) { |n| "Category #{n}" }
  end
end
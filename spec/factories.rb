FactoryGirl.define do
  factory :student do
    sequence(:name) { |n| "Student #{n}" }
    sequence(:s_id, 300001) { |n| n }
    grade 12
    birthdate '1/1/1995'

    factory :admin do
      admin true
    end
  end

  factory :candidate do
    sequence(:name) { |n| "Candidate #{n}" }
    sequence(:s_id, 200001) { |n| n }
    grade 12
    birthdate '1/1/1995'
    category
  end

  factory :category do
    sequence(:name) { |n| "Category #{n}" }
  end

  factory :asb_category do
    sequence(:name) { |n| "Category #{n}" }
  end

  factory :grade_category do
    sequence(:name) { |n| "Category #{n}" }
    sequence(:grade) { |n| n % 6 + 7 }
  end
end
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_admins
    make_candidates
    make_students
    make_votes
  end
end

def make_admins
  admin = Student.create!(name: "Sam Lau",
                          s_id: 334767,
                          grade: 12,
                          birthdate: '9/17/1995')
  admin.toggle! :admin
  admin = Student.create!(name: "Admin User",
                          s_id: 200000,
                          grade: 12,
                          birthdate: '1/1/2000')
  admin.toggle! :admin
end

def make_candidates
  asb_cat =  AsbCategory.create! name: 'ASB President'
  us_cat = GradeCategory.create! name: 'US President', grade: 12

  Candidate.create!(name: 'George Washington',
                    s_id: 100000,
                    grade: 12,
                    birthdate: '2/22/1732',
                    category_id: us_cat.id)
  Candidate.create!(name: 'Thomas Jefferson',
                    s_id: 100001,
                    grade: 12,
                    birthdate: '4/13/1743',
                    category_id: us_cat.id)
  Candidate.create!(name: 'Abraham Lincoln',
                    s_id: 100002,
                    grade: 12,
                    birthdate: '2/12/1809',
                    category_id: us_cat.id)
  Candidate.create!(name: 'Josh Chung',
                    s_id: 100003,
                    grade: 12,
                    birthdate: '1/1/2000',
                    category_id: asb_cat.id)
  Candidate.create!(name: 'Julia Chanco',
                    s_id: 100004,
                    grade: 11,
                    birthdate: '1/1/2000',
                    category_id: asb_cat.id)
  Candidate.create!(name: 'Charlie Shin',
                    s_id: 100005,
                    grade: 10,
                    birthdate: '1/1/2000',
                    category_id: asb_cat.id)
end

def make_students
  99.times do |n|
    name = Faker::Name.name
    s_id = 300000 + n
    grade = n % 6 + 7
    birthdate = '1/1/2000'
    Student.create!(name: name,
                    s_id: s_id,
                    grade: grade,
                    birthdate: birthdate)
  end
end

def make_votes
  students = Student.all
  categories = Category.all
  voters = [students[0]] + students[7..10]
  voters.each do |voter|
    categories.each do |category|
      voter.vote_for! category.candidates.first
    end
  end
end
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_students
    make_votes
  end
end

def make_students
  admin = Student.create!(name: "Sam Lau",
                          s_id: 334767,
                          grade: 12,
                          birthdate: '9/17/1995')
  admin.toggle! :admin

  cand = Student.create!(name: 'George Washington',
                         s_id: 100000,
                         grade: 9,
                         birthdate: '2/22/1732')
  cand.toggle! :candidate
  cand = Student.create!(name: 'Thomas Jefferson',
                         s_id: 100001,
                         grade: 10,
                         birthdate: '4/13/1743')
  cand.toggle! :candidate
  cand = Student.create!(name: 'Abraham Lincoln',
                         s_id: 100002,
                         grade: 12,
                         birthdate: '2/12/1809')
  cand.toggle! :candidate
  
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
  student = Student.first
  candidates = students[1..7]
  voters = students[0..6]
  voters.each do |voter|
    candidates.each do |candidate|
      voter.votes.create! cand_id: candidate.id
    end
  end
end
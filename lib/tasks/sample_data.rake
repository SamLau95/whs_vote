namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_admin
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
  GradeCandidate.create!(name: 'George Washington',
                    s_id: 100000,
                    grade: 9,
                    birthdate: '2/22/1732')
  GradeCandidate.create!(name: 'Thomas Jefferson',
                    s_id: 100001,
                    grade: 10,
                    birthdate: '4/13/1743')
  GradeCandidate.create!(name: 'Abraham Lincoln',
                    s_id: 100002,
                    grade: 12,
                    birthdate: '2/12/1809')
  AsbCandidate.create!(name: 'Josh Chung',
                    s_id: 100003,
                    grade: 11,
                    birthdate: '1/1/2000')
  AsbCandidate.create!(name: 'Julia Chanco',
                    s_id: 100004,
                    grade: 12,
                    birthdate: '1/1/2000')
  AsbCandidate.create!(name: 'Charlie Shin',
                    s_id: 100005,
                    grade: 10,
                    birthdate: '1/1/2000')
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
  candidates = Candidate.all
  voters = [students[0]] + students[7..10]
  voters.each do |voter|
    candidates.each do |candidate|
      voter.vote_for! candidate
    end
  end
end
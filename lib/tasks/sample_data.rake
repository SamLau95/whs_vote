namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = Student.create!(name: "Sam Lau",
                            s_id: 334767,
                            grade: 12,
                            birthdate: '9/17/1995')
    admin.toggle! :admin
    99.times do |n|
      name = Faker::Name.name
      s_id = 300000 + n
      grade = n / 6 + 7
      birthdate = '2/2/1996'
      Student.create!(name: name,
                      s_id: s_id,
                      grade: grade,
                      birthdate: birthdate)
    end
  end
end
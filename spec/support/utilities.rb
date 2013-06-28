include ApplicationHelper

def valid_signin(student)
  fill_in "Student ID", with: student.s_id
  fill_in "Birthdate",  with: student.birthdate
  click_button "Sign In"
end

# def sign_in(student)
#   visit signin_path
#   fill_in "Student ID", with: student.s_id
#   fill_in "Birthdate",  with: student.birthdate
#   click_button "Sign In"
#   # Sign in when not using Capybara as well.
#   cookies[:remember_token] = student.remember_token
# end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-success', text: message)
  end
end

RSpec::Matchers.define :have_title do |t|
  match do |page|
    page.should have_selector('title', text: t)
  end
end

RSpec::Matchers.define :have_h1 do |t|
  match do |page|
    page.should have_selector('h1', text: t)
  end
end

def fill_in_valid_student_info
  fill_in 'Name', with: 'Student 1'
  fill_in 'Student ID', with: 123456
  fill_in 'Grade', with: 12
  fill_in 'Birthdate', with: '1/1/1995'
end
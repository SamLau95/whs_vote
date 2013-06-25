include ApplicationHelper

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
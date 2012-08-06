Given /^a user visits signup page$/ do
  visit signup_path
end

When /^(he|a user) submits invalid information$/ do |_|
  steps %Q{
    When a user enters invalid information
    And a user clicks signup button
  }
end

When /^(he|a user) submits valid information$/ do |_|
  steps %Q{
    When a user enters valid information
    And a user clicks signup button
  }
end

When /^(he|a user) enters invalid information$/ do |_|
  fill_in "Name",  with: ""
  fill_in "Email", with: 'foobar'
  fill_in "Password", with: ''
  fill_in "Confirmation", with: ' '
end

When /^(he|a user) enters valid information$/ do |_|
  @entered_info = FactoryGirl.build(:user)

  enter_info( @entered_info )
end

When /^(he|a user) clicks signup button$/ do |_|
  click_button "Create my account"
end

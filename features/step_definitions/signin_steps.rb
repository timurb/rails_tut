Given /^a user visits a signin page$/ do
  visit signin_path
end

When /^(he|a user) submits invalid credentials$/ do |_|
  fill_in "Email",  with: "invalid@email.com"
  fill_in "Password", with: "invalid"
  click_button "Sign in"
end

When /^(he|a user) submits valid credentials$/ do |_|
  @entered_info = FactoryGirl.build(:user)

  fill_in "Email",        with: @entered_info.email
  fill_in "Password",     with: @entered_info.password
  click_button "Sign in"
end

Given /^a user visits signup page$/ do
  visit signup_path
end

When /^a user submits invalid credentials$/ do
  fill_in "Email", with: 'foobar'
  fill_in "Password", with: ''
  fill_in "Confirmation", with: ' '
  click_button "Create my account"
end

When /^a user submits valid credentials$/ do
  @user = FactoryGirl.build(:user)
  fill_in "Name",         with: @user.name
  fill_in "Email",        with: @user.email
  fill_in "Password",     with: @user.password
  fill_in "Confirmation", with: @user.password_confirmation
  click_button "Create my account"
end

Then /^a user should see a welcome message$/ do
  page.should have_selector('div.alert.alert-success')
end

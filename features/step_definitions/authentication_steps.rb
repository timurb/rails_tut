Given /^a user visits a signin page$/ do
  visit signin_path
end

When /^he submits invalid credentials$/ do
  fill_in "Email",  with: "invalid@email.com"
  fill_in "Password", with: "invalid"
  click_button "Sign in"
end

When /^he submits valid credentials$/ do
  fill_in "Email",        with: "example@railstutorial.org"
  fill_in "Password",     with: "foobar"
  click_button "Sign in"
end

When /^the user has an account$/ do
  @user = FactoryGirl.create(:user)
end

Then /^he should see an error message$/ do
  page.should have_selector('div.alert.alert-error')
end

Then /^he should see his profile page$/ do
  page.should have_selector('title', text: @user.name)
end

Then /^he should see the signout link$/ do
  page.should have_link('Sign out', href: signout_path)
end

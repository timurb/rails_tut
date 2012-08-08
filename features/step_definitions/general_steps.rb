Given /^a user is not signed in$/ do
end

Given /^a user (is signed in|signs in)$/ do |_|
  steps %Q{
    When a user visits a signin page
    And he submits valid credentials
  }
end

Given /^(he|the user) (exists|has an account)$/ do |_,_|
  @user = FactoryGirl.create(:user)
end

Given /^(another|a wrong) user (exists|has an account)$/ do |_,_|
  @another_user = @wrong_user = FactoryGirl.create(:user, email:"another@example.com" )
end

Given /^an admin user exists$/ do
  @admin = FactoryGirl.create(:admin)
end

Then /^(he|a user) should not see an error message$/ do |_|
  page.should_not have_selector('div.alert.alert-error')
end

Then /^(he|a user) should see an error message$/ do |_|
  page.should have_selector('div.alert.alert-error')
end

Then /^(he|a user) should see a notice message$/ do |_|
  page.should have_selector('div.alert.alert-notice')
end

Then /^(he|a user) should see a success message$/ do |_|
  page.should have_selector('div.alert.alert-success')
end

Then /^(he|a user) should see the signout link$/ do |_|
  page.should have_link('Sign out', href: signout_path)
end

Then /^(he|a user) should see a signin page$/ do |_|
  page.should have_title("Sign in")
end

Then /^(he|a user) should see (his|updated) profile page$/ do |_,_|
  steps %Q{
    Then he should not see an error message
    And he should see the signout link
  }
  page.should have_header( @entered_info.name )
  page.should have_title( @entered_info.name )
end

When /^a user visits a root page$/ do
  visit root_path
end

When /^a user visits his profile page$/ do
  visit user_path(@user)
end

Then /^he should see sign in link$/ do
  page.should have_link('Sign in', href: signin_path)
end

Then /^he should not see "(.*?)" (link|menu)$/ do |link,_|
  page.should_not have_link(link)
end

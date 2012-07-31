Given /^a user is not signed in$/ do
end

Given /^a user (is signed in|signs in)$/ do |_|
  steps %Q{
    When a user visits a signin page
    And he submits valid credentials
  }
end

When /^(he|a user) submits update form$/ do |_|
  page.driver.put user_path(@user)
end

Then /^he should be redirected to a signin page$/ do
  page.status_code.should == 302
  page.response_headers["Location"].should == signin_url
end

When /^a user visits edit page for wrong user$/ do
  visit edit_user_path(@wrong_user)
end

Then /^he should not see edit page$/ do
  page.should_not have_title("Edit user")
end

When /^a user submits update form for wrong user$/ do
  page.driver.put user_path(@wrong_user)
end

Then /^he should be redirected to a root page$/ do
  page.status_code.should == 302
  page.response_headers["Location"].should == root_url
end

When /^he clicks the signout link$/ do
  click_link "Sign out"
end

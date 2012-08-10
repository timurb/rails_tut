
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

When /^(he|a user) submits a sign up$/ do |_|
  page.driver.post users_path
end

Then /^he should be redirected to his profile page$/ do
  page.status_code.should == 302
  page.response_headers["Location"].should == user_url(@user)
end

When /^users submits follow for another user$/ do
  page.driver.post relationships_path
end

When /^users submits unfollow for another user$/ do
  page.driver.delete relationship_path(@another_user)
end

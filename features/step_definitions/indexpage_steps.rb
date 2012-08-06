When /^a user visits users index page$/ do
  visit users_path
end

Then /^he should see users index page$/ do
  page.should have_title("All users")
  page.should have_header("All users")
end

Given /^several users exist in the database$/ do
  30.times {  FactoryGirl.create(:user_sequence) }
end

Then /^users index page should list each user$/ do
  User.paginate( page:1 ).each do |user|
    page.should have_selector('li', text: user.name)
  end
end

Then /^index page should have pagination$/ do
  page.should have_selector('div.pagination')
end

Then /^index page should not have delete links$/ do
  page.should_not have_link('delete')
end

Given /^a user is an admin$/ do
  steps %Q{
    When a user visits a signin page
    And he submits credentials for admin
  }
end

Then /^index page should have delete links$/ do
  page.should have_link('delete', href: user_path(User.first))
end

Then /^he should not see a link to delete himself$/ do
  page.should_not have_link('delete', href: user_path(@admin))
end

Then /^he should be able to delete users$/ do
  lambda {
    step "a user clicks delete link"
  }.should change( User, :count ).by(-1)
end

When /^a user clicks delete link$/ do
  click_link('delete')
end

When /^a user submits a DELETE request$/ do
  step "we know a number of users"
  page.driver.delete user_path(@user)
end

Then /^he should be redirected to root page$/ do
  page.status_code.should == 302
  page.response_headers["Location"].should == root_url
end

Then /^a number of users should not change$/ do
  User.should have(@usercount).members
end

Given /^he submits a DELETE request for himself$/ do
  step "we know a number of users"
  page.driver.delete user_path(@admin)
end

Given /^we know a number of users$/ do
  @usercount = User.count
end

When /^(he|a user) visits edit page$/ do |_|
  steps "Given the user exists"
  visit edit_user_path(@user)
end

Then /^(he|a user) should see edit page$/ do |_|
  page.should have_header("Update your profile")
  page.should have_title("Edit user")
  page.should have_link('change', href: 'http://gravatar.com/emails')
end

When /^(he|a user) updates page with invalid information$/ do |_|
  steps %Q{When a user enters invalid information}
  click_button "Save changes"
end

When /^(he|a user) updates page with valid information$/ do |_|
  @entered_info = FactoryGirl.build(:user)

  @entered_info.name = 'New Name'
  @entered_info.email = 'new.email@example.org'

  enter_info( @entered_info )

  click_button "Save changes"
end

Then /^(he|a user) should see updated information$/ do |_|
  step "he should see his profile page"

  # This can generally be checked via profile page but we'd better
  # do it here for the case of broken profile page.
  @user.reload.name.should == @entered_info.name
  @user.reload.email.should == @entered_info.email
end

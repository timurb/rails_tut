Given /^(he|the user) (exists|has an account)$/ do |_,_|
  @user = FactoryGirl.create(:user)
end

Then /^(he|a user) should not see an error message$/ do |_|
  page.should_not have_selector('div.alert.alert-error')
end

Then /^(he|a user) should see an error message$/ do |_|
  page.should have_selector('div.alert.alert-error')
end

Then /^(he|a user) should see a success message$/ do |_|
  page.should have_selector('div.alert.alert-success')
end

Then /^(he|a user) should see the signout link$/ do |_|
  page.should have_link('Sign out', href: signout_path)
end

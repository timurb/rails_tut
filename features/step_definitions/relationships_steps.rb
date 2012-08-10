Then /^he should see following\/followers counts$/ do
  page.should have_link("0 following", href: following_user_path(@user))
  page.should have_link("1 followers", href: followers_user_path(@user))
end

Given /^user follows another user$/ do
  @user.follow!(@another_user)
end

Given /^another user follows user$/ do
  @another_user.follow!(@user)
  @relationship = @user.relationships.find_by_followed_id(@another_user)
end

Then /^he should see a link for another user$/ do
  page.should have_link(@another_user.name, href: user_path(@another_user))
end

Then /^he should see a link for himself$/ do
  page.should have_link(@user.name, href: user_path(@user))
end

When /^he clicks the "(.*?)" button$/ do |button|
  click_button(button)
end

Then /^he should see a button with "(.*?)" value$/ do |value|
  page.should have_selector('input', value: value)
end

Then /^the user should follow another user$/ do
  @user.followed_users.should include(@another_user)
end

Then /^the user should not follow another user$/ do
  @user.followed_users.should_not include(@another_user)
end

When /^a user submits xhr follow request$/ do
  pending "Don't know how to test AJAX from cucumber"
end

When /^a user submits xhr unfollow request$/ do
  pending "Don't know how to test AJAX from cucumber"
end

Then /^response should be success$/ do
  pending "Don't know how to test AJAX from cucumber"
end

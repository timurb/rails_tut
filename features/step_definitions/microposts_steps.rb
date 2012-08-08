Given /^a micropost with content "(.*?)" exist$/ do |content|
  @microposts ||= []
  @microposts << FactoryGirl.create( :micropost, user: @user, content: content )
end

Then /^he should see micropost with content "(.*?)"$/ do |content|
  page.should have_content(content)
end

Then /^he should see a number of microposts$/ do
  page.should have_content(@user.microposts.count)
end

When /^users submits a micropost creation$/ do
  @micropost_count = Micropost.count
  page.driver.post microposts_path
end

When /^users submits a micropost deletion$/ do
  @micropost_count = Micropost.count
  page.driver.delete micropost_path(Micropost.first)
end

When /^a users creates a micropost with content "(.*?)"$/ do |content|
  @micropost_count = Micropost.count
  fill_in 'micropost_content', with: content
  click_button 'Post'
end

When /^a user clicks the delete link$/ do
  @micropost_count = Micropost.count
  click_link "delete"
end

Then /^he should not see micropost with content "(.*?)"$/ do |content|
  page.should_not have_content(content)
end

When /^(he|a user) visits another users profile page$/ do |_|
  visit user_path(@another_user)
end

Then /^he should not see delete links$/ do
  page.should_not have_link('delete')
end

Given /^a micropost with content "(.*?)" exist for another user$/ do |content|
  @microposts ||= []
  @microposts << FactoryGirl.create( :micropost, user: @another_user, content: content )
end

Then /^the micropost should not be (deleted|created)$/ do |_|
  Micropost.should have(@micropost_count).items
end

Then /^the micropost should be created$/ do
  Micropost.should have(@micropost_count+1).items
end

Then /^the micropost should be deleted$/ do
  Micropost.should have(@micropost_count-1).items
end

Then /^he should see his feed$/ do
  @user.feed.each do |item|
    page.should have_selector("li##{item.id}", text: item.content)
  end
end

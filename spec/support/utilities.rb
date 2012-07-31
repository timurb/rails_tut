require File.join( File.dirname(__FILE__), '..', '..', 'test/shared_helpers' )
include ApplicationHelper

def signin(user)
  visit signin_path
  valid_signin(user)
end

def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end

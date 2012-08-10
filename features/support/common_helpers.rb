require File.join( File.dirname(__FILE__), '..', '..', 'test/shared_helpers' )
include ApplicationHelper

def enter_info(user)
  fill_in "Name",         with: user.name
  fill_in "Email",        with: user.email
  fill_in "Password",     with: user.password
  fill_in "Confirmation", with: user.password_confirmation
end

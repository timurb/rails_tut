Feature: Index page

Background:
  Given the user has an account
  And an admin user exists
  And several users exist in the database
  When a user visits users index page

Scenario: Don't show users index page for non-authenticated users
  Given a user is not signed in
  Then he should see a signin page
  And he should see a notice message

Scenario: Show users index page for authenticated users
  Given a user is signed in
  Then he should see users index page
  And users index page should list each user
  And index page should have pagination
  And index page should not have delete links

Scenario: Show delete links for admins
  Given a user is an admin
  Then index page should have delete links
  And he should not see a link to delete himself
  And he should be able to delete users

Scenario: Prevent deleting for non-admins
  Given a user is signed in
  When a user submits a DELETE request
  Then he should be redirected to root page
  And a number of users should not change

Scenario: Prevent deleting self for admins
  Given a user is an admin
  And he submits a DELETE request for himself
  Then he should be redirected to root page
  And a number of users should not change

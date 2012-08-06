Feature: Sign In

Scenario: Unsuccessful signin
  Given a user visits a signin page
  When a user submits invalid credentials
  Then he should see an error message

Scenario: Successful signin
  Given the user has an account
  And a user visits a signin page
  When he submits valid credentials
  Then he should see his profile page

Scenario: Top menu entries
  When a user visits a root page
  Then he should see sign in link
  And he should not see "Account" menu
  And he should not see "Users" link
  And he should not see "Profile" link
  And he should not see "Settings" link
  And he should not see "Sign out" link

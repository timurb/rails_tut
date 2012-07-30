Feature: Sign In

Scenario: Unsuccessful signin
  Given a user visits a signin page
  When he submits invalid credentials
  Then he should see an error message

Scenario: Successful signin
  Given the user has an account
  And a user visits a signin page
  When he submits valid credentials
  Then he should see his profile page
  And he should see the signout link

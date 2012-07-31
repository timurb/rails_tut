Feature: Sign In

Background:
  Given a user visits a signin page

Scenario: Unsuccessful signin
  When a user submits invalid credentials
  Then he should see an error message

Scenario: Successful signin
  Given the user has an account
  When he submits valid credentials
  Then he should see his profile page

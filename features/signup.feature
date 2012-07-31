Feature: Sign up

Background:
  Given a user visits signup page

Scenario: Unsuccessfull signup
  When a user submits invalid information
  Then he should see an error message

Scenario: Successfull signup
  When a user submits valid information
  Then he should see his profile page
  And a user should see a success message

Scenario: User already exist
  Given the user has an account
  When a user submits valid information
  Then he should see an error message

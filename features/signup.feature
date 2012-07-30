Feature: Sign up

Scenario: Unsuccessfull signup
  Given a user visits signup page
  When a user submits invalid credentials
  Then he should see an error message

Scenario: Successfull signup
  Given a user visits signup page
  When a user submits valid credentials
  Then he should see his profile page
  And he should see the signout link
  And a user should see a welcome message

Scenario: User already exist
  Given the user has an account
  And a user visits signup page
  When a user submits valid credentials
  Then he should see an error message

Feature: Edit profile

Background:
  Given the user has an account
  And a user is signed in
  When a user visits edit page

Scenario: Show edit page
  Then he should see edit page

Scenario: Update profile with invalid information
  When a user updates page with invalid information
  Then he should see an error message

Scenario: Update profile with valid information
  When a user updates page with valid information
  Then he should see a success message
  And he should see updated information

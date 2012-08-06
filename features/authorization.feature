Feature: Authorization

Background:
  Given the user has an account


Scenario: Bail out non-signed users
  Given a user is not signed in
  When a user visits edit page
  Then he should see a signin page
  And he should see a notice message

Scenario: Protect from unauthenticated submit actions
  Given a user is not signed in
  When a user submits update form
  Then he should be redirected to a signin page

Scenario: Protect from editing of others info
  Given a user is signed in
  And a wrong user exists
  When a user visits edit page for wrong user
  Then he should not see edit page

Scenario: Protect from unauthorized submit actions
  Given a user is signed in
  And a wrong user exists
  When a user submits update form for wrong user
  Then he should be redirected to a root page

Scenario: Friendly forwarding
  When a user visits edit page
  And a user submits valid credentials
  Then he should see edit page

Scenario: Friendly forwarding persistence
  When a user visits edit page
  And a user submits valid credentials
  And he clicks the signout link
  And a user signs in
  Then he should see his profile page

Scenario: Signed in user should not be able to sign up again
  Given a user is signed in
  When a user visits signup page
  Then he should see his profile page

Scenario: Protect from signed in user submitting sign up again
  Given a user is signed in
  When a user submits a sign up
  Then he should be redirected to his profile page

Feature: Microposts

Background: The user is signed in
  Given the user has an account
  Given a user is signed in

Scenario: Show microposts on profile page
  Given a micropost with content "Foo" exist
  And a micropost with content "Bar" exist
  When a user visits his profile page
  Then he should see his profile page
  And he should see micropost with content "Foo"
  And he should see micropost with content "Bar"
  And he should see a number of microposts

Scenario: Show microposts on root page
  Given a micropost with content "Foo" exist
  And a micropost with content "Bar" exist
  When a user visits a root page
  Then he should see micropost with content "Foo"
  And he should see micropost with content "Bar"
  And he should see his feed

Scenario: Users should not be able to create microposts with invalid information
  When a user visits a root page
  And a users creates a micropost with content " "
  Then he should see an error message
  And he should not see micropost with content "Foo"
  And the micropost should not be created

Scenario: Users should be able to create microposts with valid information
  When a user visits a root page
  And a users creates a micropost with content "Foo"
  Then he should see micropost with content "Foo"
  And the micropost should be created

Scenario: Users should be able to delete microposts
  Given a micropost with content "Foo" exist
  When a user visits a root page
  And a user clicks the delete link
  Then he should not see micropost with content "Foo"
  And the micropost should be deleted

Scenario: Users should not be see any delete links for microposts they don't own
  Given another user exists
  And a micropost with content "Foo" exist for another user
  When a user visits a root page
  Then he should not see delete links

Scenario: Users should not be able to delete microposts they don't own
  Given another user exists
  And a micropost with content "Foo" exist for another user
  When users submits a micropost deletion
  And he visits another users profile page
  Then he should see micropost with content "Foo"
  And the micropost should not be deleted

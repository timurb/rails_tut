Feature: Relationships

Background: The user is signed in
  Given the user has an account
  Given another user has an account
  Given a user is signed in

Scenario: Show microposts on root page
  Given another user follows user
  When a user visits a root page
  And he should see following/followers counts

Scenario: Show following page
  Given user follows another user
  When a user visits following page
  Then he should see "Following" page
  And he should see a link for another user

Scenario: Show followers page
  Given user follows another user
  When a user visits followers page for another user
  Then he should see "Followers" page
  And he should see a link for himself

Scenario: Follow button
  When a user visits another users profile page
  And he clicks the "Follow" button
  Then he should see a button with "Unfollow" value
  And the user should follow another user

Scenario: Unfollow button
  Given user follows another user
  When a user visits another users profile page
  And he clicks the "Unfollow" button
  Then he should see a button with "Follow" value
  And the user should not follow another user

Scenario: Follow ajax button
  When a user submits xhr follow request
  Then response should be success
  And the user should follow another user

Scenario: Unfollow ajax button
  Given user follows another user
  When a user submits xhr unfollow request
  Then response should be success
  And the user should not follow another user

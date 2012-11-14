Feature: User profiles
  In order for people to know who they're interacting with
  A user
  Should have some public details made available

  Scenario: Redirecting an unauthenticated user when they attempt to view a user
    Given a user
    And I am not logged in
    When I visit the user page
    Then I should be on the sign-in page

  Scenario: A logged in user views a user page
    Given I am logged in
    When I visit the user page
    Then I should be on the user page

  Scenario: Seeing a busy user's details
    Given I am logged in
    And I have 10 comments in a conversation in a forum
    When I visit the user page
    Then I should see a comment count of 10
    And I should see a conversation count of 1
    And I should see 10 items in my activity stream
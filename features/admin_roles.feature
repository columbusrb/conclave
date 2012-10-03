Feature: Admin
  In order to admin the site
  as a User
  I want to modify the the role of a User

  Background:
    Given I am logged in
    And I have the role of "admin"

  Scenario: Change the role of another user
    Given a site user with the role of "contributor"
    When I visit the edit admin role page
    And I edit the site user to be "banned"
    Then the site user should be "banned"
Feature: Admin
  In order to admin the site
  as a User
  I want to modify attributes of a User

  Background:
    Given I am logged in
    And I have the role of "admin"

  Scenario: Changing the password of a site user
    Given a site user with the role of "contributor"
    When I visit the edit admin user page
    And I edit the site user password to be "potato"
    Then the site user password should be the encrypted password for that site user
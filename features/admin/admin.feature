Feature: Admin
  In order to Admin the site
  as a User
  I want to modify all attributes of the site

  Background:
    Given I am logged in
    And I have the role of "admin"

  Scenario: Admin Navigation
    When I visit the admin root page
    Then I should see an admin menu item for "Dashboard"
    And I should see an admin menu item for "Forums"
    And I should see an admin menu item for "Users"
    And I should see an admin menu item for "Comments"
    And I should see an admin menu item for "Conversations"


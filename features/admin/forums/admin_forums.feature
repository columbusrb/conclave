Feature: Admin
  In order to admin the site
  as a User
  I want to modify attributes of a Forum

  Background:
    Given I am logged in
    And I have the role of "admin"

  Scenario: Admin Forum List
    Given a forum called "On Topic"
    When I visit the admin forums page
    Then I should see an admin entry for "On Topic"

  Scenario: Renaming a Forum
    Given a forum called "On Topic"
    When I visit the admin forum page
    And I click the "Edit Forum" link
    And I edit the forum title to be "Off Topic"
    Then the forum title should be "Off Topic"

  Scenario: Creating a new Forum
    When I visit the new admin forum page
    And I edit the forum title to be "On Topic"
    Then the forum title should be "On Topic"

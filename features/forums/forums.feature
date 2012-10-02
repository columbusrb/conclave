Feature: Forums
  In order to navigate topics of conversation
  As a user
  I want to see a list of forums


  Scenario: The root path goes to the forum index page
    Given a forum called "On Topic"
    When I visit the root path
    Then I should see a forum link titled "On Topic"

  Scenario: List forums on forums index page
    Given a forum called "On Topic"
    When I visit the forums index page
    Then I should see a forum link titled "On Topic"

  Scenario: The breadcrumbs paths on the forum index page
    Given a forum called "On Topic"
    When I visit the root path
    Then I should see a breadcrumb element titled "Forums"

  Scenario: The breadcrumbs paths on the forum show page
    Given a forum called "On Topic"
    When I visit the forum
    Then I should see a breadcrumb link titled "Forums"
    And I should see a breadcrumb element titled "On Topic"

  Scenario: User is banned mid-session
    Given I exist as a user
    And I visit the forums index page
    When I am banned
    And I visit the forums index page
    Then I should be signed out


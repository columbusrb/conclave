Feature: Admin Static Content
  In order to admin static content
  as a User
  I want to modify attributes of pages

  Background:
    Given I am logged in
    And I have the role of "admin"

  Scenario: Editing an existing static page
    Given a page
    When I edit the page content to say "Junglist Massive"
    And I visit the page path
    Then I should see the page content "Junglist Massive"

  Scenario: Creating a new static page
    When I create a new page with the content "Wicked Wicked"
    And I visit the page path
    Then I should see the page content "Wicked Wicked"

  Scenario: Adding a static page to the navbar
    Given a page
    When I edit the page position to be in the navbar
    And I visit the forums index page
    Then I should see a link to the page in the navbar

  Scenario: Adding a static page to the footer
    Given a page
    When I edit the page position to be in the footer
    And I visit the forums index page
    Then I should see a link to the page in the footer
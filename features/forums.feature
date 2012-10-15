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

  Scenario: SEO friendly URLS
    Given a forum called "On Topic"
    When I visit the forum
    Then I should see a seo friendly url with "1-on-topic"

  Scenario: Conversations with new content should be marked
    Given a forum and a conversation with 10 comments
    And I am logged in
    When I visit the forum
    Then I should see that there is new content
    When I visit the conversation page
    Then I visit the forum
    Then I should not see that there is new content


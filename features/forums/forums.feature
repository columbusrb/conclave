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
  

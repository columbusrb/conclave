Feature: Forums
  In order to navigate topics of conversation
  As a user
  I want to see a list of forums

  @not-ready
  Scenario: List forums on forums index page
    Given a forum called "On Topic"
    When I visit the forums index page
    Then I should see a forum titled "On Topic"
  
  
  

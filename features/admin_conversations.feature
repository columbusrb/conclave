Feature: Admin Conversations
  In order to maintain order in the conversation realm
  as an Admin
  I want to edit the attributes of a conversation

  Background:
    Given I am logged in
    And I have the role of "admin"

  Scenario: Change a conversations' forum
    Given a forum called "Hatredcopter" with one conversation
    And a forum called "Thunderhorse"
    When I move the conversation to "Thunderhorse"
    And I visit the forums index page
    Then I should see 1 conversations in "Thunderhorse"
    And I should see 0 conversations in "Hatredcopter"

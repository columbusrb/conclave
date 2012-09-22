Feature: Conversations
  In order to hold conversations
  As a user
  I want create and add comments to conversations
  
  Background:
    Given I am logged in
  
  Scenario: Create a new conversation
    Given a forum and a conversation
    When I visit the forum show page
    Then I should see the conversation on the forum's show page
    
  Scenario: Show New Conversation Button
    Given a forum
    When I visit the forum show page
    Then I should see a button labeled "New Conversation"
  
  
  

  

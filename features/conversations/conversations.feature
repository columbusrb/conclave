Feature: Conversations
  In order to hold conversations
  As a user
  I want create and add comments to conversations
  
  Background:
    Given I am logged in
  
  Scenario: Show Conversations
    Given a forum and a conversation
    When I visit the forum show page
    Then I should see the conversation on the forum's show page
    
  Scenario: Show New Conversation Button
    Given a forum
    When I visit the forum show page
    Then I should see a button labeled "New Conversation"
  
  Scenario: Create a conversation
    Given a forum
    When I create a new conversation on the forum
    Then I should see the conversation's index page
    
  Scenario: Conversation comments display on the conversation comments page
    Given a conversation with a comment
    When I visit the conversation comments page
    Then I should see the comment content on the page
  
  

  

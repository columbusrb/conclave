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
    And I should see the date of the comment's creation
    And I should see the gravatar for the comment's creator
  
  Scenario: Show an existing conversation in a forum
  	Given a forum and a conversation
  	When I visit the forum show page
  	Then I should see the conversation on the forum's show page
  	And I should see a link to the conversation's show page
  
  Scenario: Show the number of comments for a conversation
  	Given a forum and a conversation with 10 comments
  	When I visit the forum show page
  	Then The comment count for the conversation should be 10
	And I should see the date of the conversation's most recent comment
  
  Scenario: Show the date of the most recent comment for a conversation
  	Given a forum and a conversation with 1 comment
  	When I visit the forum show page
  	Then I should see the date of the conversation's most recent comment
  	
  Scenario: Reply button should show for existing conversation
    Given a forum and a conversation
    When I visit the conversation comments page
    Then I should see a button labeled "Reply"
  
  Scenario: Reply button takes user to reply form
    Given a forum and a conversation
    When I click the reply button on the forum show page
    Then I should be on the new comment page for the conversation
    
  Scenario: Submitting a reply shows the reply on the conversation page
    Given a forum and a conversation
    When I submit a reply to the conversation with the content "Hello from Cucumber"
    Then the conversation should show the new comment with the content "Hello from Cucumber"

  Scenario: Quick Reply Form
    Given a forum and a conversation
    When I visit the conversation comments page
    Then there will be a form at the bottom to submit a quick reply
    
  @javascript
  Scenario: Submit Quick Reply
    Given a forum and a conversation
    When I submit a quick reply with the content "Personally I think Apple is the best pie"
    Then I should see the comment with the content "Personally I think Apple is the best pie"
    
  Scenario: Comments should have an edit button
    Given a forum and a conversation with 1 comments
    When I visit the conversation comments page
    Then there will be an edit button on the comment

  Scenario: Edit a comment
    Given a forum and a conversation
    And a comment with the content "The Skinny Vanilla Latte is by far the best"
    When I edit the comment to say "The Pumpkin Spice Latte is by far the best"
    Then I the conversation should display the content "The Pumpkin Spice Latte is by far the best"


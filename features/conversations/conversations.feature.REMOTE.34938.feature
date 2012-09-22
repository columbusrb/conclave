Feature: Conversations
	In order to hold conversations
	As a user
	I want create and add comments to conversations

	Background:
		Given I am logged in


	Scenario: Show New Conversation Button
		Given a forum
		When I visit the forum show page
		Then I should see a button labeled "New Conversation"

	Scenario: Show an existing conversation in a forum
		Given a forum and a conversation
		When I visit the forum show page
		Then I should see the conversation on the forum's show page
    And I should see a link to the conversation's show page
  
  Scenario: Show the number of comments for a conversation
    Given a forum and a conversation with 10 comments
    When I visit the forum show page
    Then The comment count for the conversation should be 10

  Scenario: Show the date of the most recent comment for a conversation
    Given a forum and a conversation
    When I visit the forum show page
    Then I should see the date of the conversation's most recent comment








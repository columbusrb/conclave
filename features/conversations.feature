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
    Then I should see a link labeled "New Conversation"

  Scenario: Create a conversation
    Given a forum
    When I create a new conversation on the forum
    Then I should see the conversation's index page

  Scenario: Viewing my conversations
    Given a forum and a conversation
    And I am logged in
    When I create a new conversation on the forum
    When I visit the my conversations page
    Then I should see my conversation

  Scenario: Conversation comments display on the conversation comments page
    Given a conversation with a comment
    When I visit the conversation page
    Then I should see the comment content on the page
    And I should see the date of the comment's creation
    And I should see the avatar for the comment's creator

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

  Scenario: Reply link should show for existing conversation
    Given a forum and a conversation
    When I visit the conversation page
    Then I should see a link labeled "Reply"

  Scenario: Submitting a reply shows the reply on the conversation page
    Given a forum and a conversation
    When I submit a reply to the conversation with the content "Hello from Cucumber"
    Then the conversation should show the new comment with the content "Hello from Cucumber"

  Scenario: Quick Reply Form
    Given a forum and a conversation
    When I visit the conversation page
    Then there will be a form at the bottom to submit a quick reply

  Scenario: New Conversation Breadcrumbs
    Given a forum
    When I go to the new conversation form
    Then I should see a breadcrumb link titled "Forums"
    And I should see a breadcrumb link with the forum title
    And I should see a breadcrumb element titled "New Conversation"

  Scenario: Existing Conversation Breadcrumbs
    Given a forum and a conversation
    When I visit the conversation page
    Then I should see a breadcrumb link titled "Forums"
    And I should see a breadcrumb link with the forum title
    And I should see a breadcrumb element with the conversation title

  Scenario: Redaction Button
    Given a conversation with a comment
    And I am an admin
    When I visit the conversation page
    Then I should see a "Redact" button on the comment

  Scenario: Redacting a Comment
    Given a conversation with a comment
    And I am an admin
    When I visit the conversation page
    And I redact the comment
    Then I should see that the comment is redacted

  Scenario: Unredaction button
    Given a conversation with a comment
    And I am an admin
    When I visit the conversation page
    And I redact the comment
    Then I should see a "Unredact" button on the comment

  Scenario: Unredacting a Comment
    Given a conversation with a comment
    And I am an admin
    When I visit the conversation page
    And I redact the comment
    And I unredact the comment
    Then I should see the comment

  @javascript
  Scenario: Submit Quick Reply
    Given a forum and a conversation
    When I submit a quick reply with the content "Personally I think Apple is the best pie"
    Then I should see the comment with the content "Personally I think Apple is the best pie"

  Scenario: Comments I authored should have an edit button
    Given a forum and a conversation with 1 comments that I authored
    When I visit the conversation page
    Then there will be an edit button on the comment

  Scenario: Edit a comment
    Given a forum and a conversation
    And a comment I authored with the content "The Skinny Vanilla Latte is by far the best"
    When I edit the comment to say "The Pumpkin Spice Latte is by far the best"
    Then I the conversation should display the content "The Pumpkin Spice Latte is by far the best"

  Scenario: Ban button bans a User
    Given I am an admin
    And a conversation with a comment
    When I visit the conversation page
    And I click the ban button
    Then I should see that the user is banned

  Scenario: Ban button does not appear for an Admin or Moderator
    Given I am an admin
    And a conversation with a comment posted by an Admin
    When I visit the conversation page
    Then I should not see a "ban" button on the comment

  Scenario: Toggling watching a conversation
    Given a forum and a conversation
    And I am logged in
    When I visit the conversation page
    And I watch the conversation
    Then I should see the conversation's index page
    And I should see that I am watching the conversation
    And I unwatch the conversation
    Then I should see the conversation's index page
    And I should see that I am not watching the conversation

  Scenario: Viewing watched conversations
    Given a forum and a conversation
    And I am logged in
    When I visit the conversation page
    And I watch the conversation
    And I go to my watched conversations page
    Then I should see my watched conversations



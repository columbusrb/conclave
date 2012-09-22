#
# Given Steps
#
Given /^a forum and a conversation$/ do
  @forum = create(:forum)
  @conversation = create(:conversation, forum: @forum)
end
Given /^a forum$/ do
  @forum = create(:forum)
end

Given /^a conversation with a comment$/ do
  @conversation = create(:conversation)
  @comment = create(:comment, conversation: @conversation)
end

#
# When Steps
#

When /^I visit the forum show page$/ do
  visit forum_path(@forum)
end

When /^I create a new conversation on the forum$/ do
  visit forum_path(@forum)
  click_link "New Conversation"
  fill_in "conversation_title", with: "My Awesome Thread"
  fill_in "conversation_comment_content", with: "My Awesome Body"
  click_button "Submit Conversation"
  @conversation = Conversation.last
end

When /^I visit the conversation comments page$/ do
  visit conversation_comments_path(@conversation)
end


#
# Then Steps
#

Then /^I should see the conversation's index page$/ do
  current_path.should eq conversation_comments_path(@conversation)
end

Then /^I should see the conversation on the forum's show page$/ do
  page.should have_content @conversation.title
end

Then /^I should see a button labeled "(.+)"$/ do |label|
  page.should have_link label
end

Then /^I should see the comment content on the page$/ do
  within("#comment_#{@comment.id}") do
    page.should have_content @comment.content
  end
end

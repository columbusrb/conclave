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

Given /^a forum and a conversation with (\d+) comments?$/ do |count|
  @forum = create(:forum)
  @conversation = create(:conversation, forum: @forum)
  count.to_i.times do 
    create(:comment, conversation: @conversation)
  end
  @comment = @conversation.comments.last
end

Given /^a comment with the content "(.+)"$/ do |content|
  @comment = create(:comment, conversation: @conversation, content: content)
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

When /^I click the reply button on the forum show page$/ do
  visit conversation_comments_path(@conversation)
  click_link "Reply"
end

When /^I submit a reply to the conversation with the content "(.+)"$/ do |content|
  visit new_conversation_comment_path(@conversation)
  fill_in "comment_content", :with => content
  click_button "Submit Comment"
end

When /^I submit a quick reply with the content "(.+)"$/ do |content|
  visit conversation_comments_path(@conversation)
  fill_in "comment_content", :with => content
  click_button "Submit Comment"
end

When /^I edit the comment to say "(.+)"$/ do |content|
  visit conversation_comments_path(@conversation)
  within "#comment_#{@comment.id}" do
    click_link "Edit"
  end
  fill_in "comment_content", :with => content
  click_button "Submit Comment"
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

Then /^I should see a link to the conversation's show page$/ do
  within("#conversation_#{@conversation.id}") do
    page.should have_link @conversation.title
  end
end


Then /^The comment count for the conversation should be (\d+)$/ do |count|
  within("#conversation_#{@conversation.id}") do
    page.should have_content count
  end
end

Then /^I should see the date of the conversation's most recent comment$/ do
  within("#conversation_#{@conversation.id}") do
    page.should have_content @comment.created_at.strftime("%m/%d/%Y")
  end
end

Then /^I should be on the new comment page for the conversation$/ do
  current_path.should eq new_conversation_comment_path(@conversation)
end

Then /^the conversation should show the new comment with the content "(.+)"$/ do |content|
  page.should have_content content
end

Then /^there will be a form at the bottom to submit a quick reply$/ do
  page.should have_selector "#quick_reply_form"
end

Then /^I should see the comment with the content "(.+)"$/ do |content|
  page.should have_content content
end

Then /^there will be an edit button on the comment$/ do
  within("#comment_#{@comment.id}") do
    page.should have_link 'Edit'
  end
end

Then /^I the conversation should display the content "(.+)"$/ do |content|
  within("#comment_#{@comment.id}") do
    page.should have_content content
  end
end

Then /^I should see the date of the comment's creation$/ do
  within("#comment_#{@comment.id}") do
    page.should have_content @comment.created_at.strftime("%m/%d/%Y")
  end
end

Then /^I should see the gravatar for the comment's creator$/ do
  within("#comment_#{@comment.id}") do
    page.should have_selector("img", :class => "gravatar")
  end
end

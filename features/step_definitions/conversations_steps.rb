#GIVEN#
Given /^a forum and a conversation$/ do
  @forum = create(:forum)
  @conversation = create(:conversation, forum: @forum)
  @comment = create(:comment, conversation: @conversation)
end
Given /^a forum$/ do
  @forum = create(:forum)
end

Given /^a forum and a conversation with (\d+) comments$/ do |count|
  @forum = create(:forum)
  @conversation = create(:conversation, forum: @forum)
  count.to_i.times do 
    create(:comment, conversation: @conversation)
  end
  @comment = @conversation.comments.first
end

#WHEN#

When /^I visit the forum show page$/ do
  visit forum_path(@forum)
end

#THEN#
Then /^I should see the conversation on the forum's show page$/ do
  page.should have_content @conversation.title
end

Then /^I should see a button labeled "(.+)"$/ do |label|
  page.should have_link label
end

Then /^I should see a link to the conversation's show page$/ do
  page.should have_link @conversation.title
end


Then /^The comment count for the conversation should be (\d+)$/ do |count|
  page.should have_content count
end

Then /^I should see the date of the conversation's most recent comment$/ do
  page.should have_content @comment.created_at.strftime("%m/%d/%Y")
end


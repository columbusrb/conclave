Given /^a forum and a conversation$/ do
  @forum = create(:forum)
  @conversation = create(:conversation, forum: @forum)
end

When /^I visit the forum show page$/ do
  visit forum_path(@forum)
end

Then /^I should see the conversation on the forum's show page$/ do
  page.should have_content @conversation.title
end
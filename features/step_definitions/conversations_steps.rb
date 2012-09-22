Given /^a forum and a conversation$/ do
  @forum = create(:forum)
  @conversation = create(:conversation, forum: @forum)
end
Given /^a forum$/ do
  @forum = create(:forum)
end

When /^I visit the forum show page$/ do
  visit forum_path(@forum)
end

Then /^I should see the conversation on the forum's show page$/ do
  page.should have_content @conversation.title
end

Then /^I should see a button labeled "(.+)"$/ do |label|
  page.should have_link label
end
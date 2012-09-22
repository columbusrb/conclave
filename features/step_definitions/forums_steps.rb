#
# Given Step Definitions
#
Given /^a forum called "(.+)"$/ do |title|
  @forum = create(:forum, title: title)
end
#
# When Step Definitions
#

When /^I visit the forums index page$/ do
  visit forums_path
end

When /^I visit the root path$/ do
  visit root_path
end

#
# Then Step Definitions
#
Then /^I should see a forum titled "(.+)"$/ do |title|
  within("tr#forum_#{@forum.id}") do
    page.should have_content title
  end
end
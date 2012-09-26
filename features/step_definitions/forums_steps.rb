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

When /^I visit the forum$/ do
  visit forum_path(@forum)
end

#
# Then Step Definitions
#
Then /^I should see a forum link titled "(.+)"$/ do |title|
  within("tr#forum_#{@forum.id}") do
    page.should have_link title
  end
end

Then /^I should see a breadcrumb link titled "(.+)"$/ do |title|
  within("ul.breadcrumb") do
    page.should have_link title
  end
end

Then /^I should see a breadcrumb element titled "(.+)"$/ do |title|
  within("ul.breadcrumb") do
    page.should have_content title
  end
end  
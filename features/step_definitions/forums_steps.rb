#
# Given Step Definitions
#
Given /^a forum called "(.+)"$/ do |title|
  @forum = create(:forum, title: title)
end

Given /^a forum and a conversation that is not closed$/ do
  @forum = create(:forum)
  @conversation = create(:conversation, forum: @forum)
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

Then /^I should see a seo friendly url with "(.+)"$/ do |url|
  current_path.should match \/forums\/\d+-#{url}\/
end

Then /^I should not see closed conversations$/ do
  page.should_not have_css("#closed_conversations")
end

Then /^I should see the site hero title "(.*?)"$/ do |hero_title|
  within('div.hero-unit h1') do
    page.should have_content hero_title
  end
end

Then /^I should see the site hero desc "(.*?)"$/ do |hero_desc|
  within('div.hero-unit p') do
    page.should have_content hero_desc
  end
end
# Given steps

# When Steps
When /^I visit the admin forums page$/ do
  visit admin_forums_path
end

When /^I visit the admin root page$/ do
  visit admin_root_path
end

When /^I visit the new admin forum page$/ do
  visit new_admin_forum_path
end

When /^I visit the admin forum page$/ do
  visit admin_forum_path(@forum)
end

When /^I click the "(.*?)" link$/ do |link|
  click_link link
end

When /^I edit the forum title to be "(.*?)"$/ do |new_title|
  fill_in "forum_title", with: new_title
  click_button ' Forum'
end

# Then Steps
Then /^I should see an admin entry for "(.*?)"$/ do |topic|
  page.should have_content(topic)
end

Then /^I should see an admin menu item for "(.*)"$/ do |menu_item|
  within("#header ul.header-item") do
    page.should have_link(menu_item)
  end
end

Then /^the forum title should be "(.*?)"$/ do |title|
  page.should have_content(title)
end
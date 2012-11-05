# Given Steps

Given /^a page$/ do
  @page = create(:page)
end

# When Steps

When /^I edit the page content to say "(.*?)"$/ do |content_text|
  visit edit_admin_page_path(@page)
  fill_in "Content", with: content_text
  click_button "Update Page"
end

When /^I visit the page path$/ do
  visit page_path(@page)
end

When /^I create a new page with the content "(.*?)"$/ do |page_content|
  visit new_admin_page_path
  fill_in "Name", with: "New Page"
  fill_in "Permalink", with: "permalink"
  fill_in "Content", with: page_content
  click_button "Create Page"
  @page = Page.find_by_permalink("permalink")
end

# Then Steps

Then /^I should see the page content "(.*?)"$/ do |page_content|
  page.should have_content page_content
end
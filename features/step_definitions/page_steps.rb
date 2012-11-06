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

When /^I edit the page position to be in the navbar$/ do
  visit edit_admin_page_path(@page)
  page.select("navbar", from: 'page_placement')
  click_button "Update Page"
end

When /^I edit the page position to be in the footer$/ do
  visit edit_admin_page_path(@page)
  page.select("footer", from: 'page_placement')
  click_button "Update Page"
end

# Then Steps

Then /^I should see the page content "(.*?)"$/ do |page_content|
  page.should have_content page_content
end

Then /^I should see a link to the page in the navbar$/ do
  within('.navbar') do
    page.should have_link(@page.name, {href: page_path(@page)})
  end
end

Then /^I should see a link to the page in the footer$/ do
  within('#footer') do
    page.should have_link(@page.name, {href: page_path(@page)})
  end
end
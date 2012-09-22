Given /^a forum called "(.+)"$/ do |title|
  @forum = create(:forum, title: title)
end

When /^I visit the forums index page$/ do
  visit forums_path
end

Then /^I should see a forum titled "(.*?)"$/ do |arg1|
  within("tr#forum_#{@forum.id}") do
    page.should have_content @forum.title
  end
end
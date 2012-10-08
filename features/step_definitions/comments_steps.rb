# Given steps

# When steps

When /^I redact the comment$/ do
  click_link "Redact"
end

When /^I unredact the comment$/ do
  click_link "Unredact"
end

# Then steps

Then /^I should see that the comment is redacted$/ do
  within("#comment_#{@comment.id}") do
    page.should have_content 'Comment Redacted'
    page.should have_content @comment.redacted_at
    page.should have_content @user.email
  end
end

Then /^I should see the comment$/ do
  within("#comment_#{@comment.id}") do
    page.should have_content @comment.content
    page.should have_content @comment.created_at
    page.should have_content @comment.user.email
  end
end
### UTILITY METHODS ###

def create_visitor
  @visitor ||= { :email => "example@example.com",
    :password => "please", :password_confirmation => "please", :nickname => "shatner" }
end

def create_site_user
  @site_user ||= FactoryGirl.create(:user, email: 'me@my.net', password: 'password', password_confirmation: 'password')
end

def find_site_user
  @site_user ||= User.where(email: @site_user[:email]).first
end

def find_user
  @user ||= User.where(:email => @visitor[:email]).first
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  visit '/users/sign_out'
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, email: @visitor[:email], last_sign_in_ip: "127.0.0.1")
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit '/users/sign_up'
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
  fill_in "Nickname", :with => @visitor[:nickname]
  click_button "Sign up"
  find_user
end

def sign_in
  visit '/users/sign_in'
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  click_button "Sign in"
end

### GIVEN ###
Given /^I click "(.*?)"$/ do |text|
  click_link text
end

Given /^I am on the root page$/ do
  visit "/"
end

Given /^Twitter User is logged in$/ do
  visit new_user_session_path
  click_link 'Sign in with Twitter'
end

Given /^I am not logged in$/ do
  visit '/users/sign_out'
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I exist as a banned user$/ do
  create_user
  @user.ban!
end

Given /^another user with my IP address is banned$/ do
  @banned_user = FactoryGirl.create(:user, email: "banned@user.org", last_sign_in_ip: "127.0.0.1")
  @banned_user.ban!
end

Given /^I am an admin$/ do
  @user.role = "admin"
  @user.save!
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I exist as an unconfirmed user$/ do
  create_unconfirmed_user
end

Given /^I have the role of "(.+)"$/ do |role|
  @user.update_attribute(:role, role )
end

Given /^a site user with the role of "(.*?)"$/ do |role|
  create_site_user
  @site_user.update_attribute(:role, role)
end

Given /^a user$/ do
  @user = create_user
end

Given /^I have (\d+) comments in a conversation in a forum$/ do |comments_count|
  @forum = create(:forum)
  @conversation = create(:conversation, forum: @forum, creator: @user)
  comments_count.to_i.times do
    create(:comment, conversation: @conversation, user: @user)
  end
end

### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  visit '/users/sign_out'
end

When /^I sign up with valid user data$/ do
  create_visitor
  sign_up
end

When /^I sign up with an invalid email$/ do
  create_visitor
  @visitor = @visitor.merge(:email => "notanemail")
  sign_up
end

When /^I sign up without a password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "")
  sign_up
end

When /^I sign up without a password$/ do
  create_visitor
  @visitor = @visitor.merge(:password => "")
  sign_up
end

When /^I sign up with a mismatched password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "please123")
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

When /^I edit my account details$/ do
  click_link "Edit account"
  fill_in "Current password", :with => @visitor[:password]
  click_button "Update"
end

When /^I look at the list of users$/ do
  visit '/'
end

When /^I am banned$/ do
  @user.ban!
end

When /^I visit the user page$/ do
  visit user_path(@user)
end

### THEN ###
Then /^I should see that I am banned$/ do
  within "#flash_alert" do
    page.should have_content "banned until"
  end
end

Then /^I should be signed in$/ do
  page.should have_content "Sign out"
  page.should_not have_content "Sign up"
  page.should_not have_content "Sign in"
end

Then /^I should be signed out$/ do
  page.should have_content "Sign up"
  page.should have_content "Sign in"
  page.should_not have_content "Sign out"
end

Then /^I see an unconfirmed account message$/ do
  page.should have_content "You have to confirm your account before continuing."
end

Then /^I see a successful sign in message$/ do
  page.should have_content "Signed in successfully."
end

Then /^I should see a successful sign up message$/ do
  page.should have_content "Welcome! You have signed up successfully."
end

Then /^I should see an invalid email message$/ do
  page.should have_content "Emailis invalid"
end

Then /^I should see a missing password message$/ do
  page.should have_content "Passwordcan't be blank"
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "Passworddoesn't match confirmation"
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "Passworddoesn't match confirmation"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I see an invalid login message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I should see an account edited message$/ do
  page.should have_content "You updated your account successfully."
end

Then /^I should see an email prompt$/ do
  page.should have_content "EMAIL!"
end

Then /^I enter an email and a password$/ do
  fill_in "user_email", :with => "yser@email.com"
  fill_in "user_password", :with => "sdaf666"
  fill_in "user_password_confirmation", :with => "sdaf666"
  click_button "Update User"
end

Then /^I should be on the root page$/ do
  page.current_path.should == "/"
end

Then /^I should be on the sign\-in page$/ do
  page.current_path.should eq new_user_session_path
end

Then /^I should be on the user page$/ do
  page.current_path.should eq user_path(@user)
end

Then /^I should see a comment count of (\d+)$/ do |comment_count|
  within('#comments-count') do
    page.should have_content comment_count
  end
end

Then /^I should see a conversation count of (\d+)$/ do |conversation_count|
  within('#conversations-count') do
    page.should have_content conversation_count
  end
end

Then /^I should see (\d+) items in my activity stream$/ do |arg1|
  within('#activity-stream') do
    page.should have_selector('.comment', count: 10)
  end
end

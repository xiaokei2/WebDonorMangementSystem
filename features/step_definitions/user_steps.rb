Given /^the following users exist:$/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
    
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that user to the database here.
  end
end

Given(/^I am viewing the home page$/) do
  visit root_path #TODO:Change to path for donor pages when defined
end

Then(/^I use my email to confirm my account$/) do
  email = open_email(@user.email)
  email.should deliver_to(@user.email)
  click_link "Confirm My Account"
  sleep 2
end

Before('@firefox') do
  Capybara.current_driver = :selenium
end
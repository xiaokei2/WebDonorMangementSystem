Given /^the following donor_profiles exist:$/ do |donor_profiles_table|
  donor_profiles_table.hashes.each do |donor_profile|
    DonorProfile.create!(donor_profile)
    
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that donor to the database here.
  end
end

Given(/^I am viewing the donor page$/) do
  visit donor_profiles_path #TODO:Change to path for donor pages when defined
end

Then(/^I click on add new donor_profile$/) do
   visit new_donor_profile_path
end

Then(/^I click on Amount Donated$/) do
   visit new_donor_profile_path
end

Then(/^I visit the users page$/) do
   visit users_path
end
Feature: view list of donor profiles
 
  As an admin
  So that I may see a consolidated list of donors
  I want to be able to view a list of donor profiles by name
  
Background: donor_profiles in database
 
  Given the following donor_profiles exist:
  | first_name   | last_name |
  | Alex         | Dubois    |
  | Kyle         | Raney     |
 
Scenario: view donor profile
  Given I am viewing the donor page
  Then I should see "Alex"
 
Scenario: can't find donor_profile that did not pre-exist (sad path)
  Given I am viewing the donor page
  Then  I should not see "Benny"
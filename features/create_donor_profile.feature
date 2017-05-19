Feature: create donor profiles
 
  As a Health for All Employee
  So I can cleanly store donor information
  I want to be able to creat donor profiles
 
Scenario: add new donor_profile
  Given I am viewing the donor page
  Then I click on add new donor_profile
  And  I fill in "First Name" with "Vinny"
  And  I fill in "Last Name" with "Huang"
  And  I press "Save Changes"
  Then I should see "Vinny"
 
Scenario: can't find donor_profile that has not been added (sad path)
  Given I am viewing the donor page
  Then I click on add new donor_profile
  And  I fill in "First Name" with "John"
  And  I fill in "Last Name" with "Cena"
  And  I press "Save Changes"
  Then I should not see "Shaobo"
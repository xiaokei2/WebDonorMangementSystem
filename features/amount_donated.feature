Feature: Amount Donated
 
  As a Health for All Employee
  So I may track and dynamically add donations
  I want to be able to be able to add and associate amounts donated to specific donation interests

Background: donor_profiles in database
 
  Given the following donor_profiles exist:
  | first_name   | last_name | 
  | Alex         | Dubois    |
  | Kyle         | Raney     |
  
  Given the following users exist:
  | name  | email                        | password | admin  | activated  |
  | Alex  | example@railstutorial.org    | pw1234   | true   | true       |

Scenario: add new donation
  Given I am viewing the home page
  When I follow "Log in"
  Then I fill in "Email" with "example@railstutorial.org"
  And I fill in "Password" with "pw1234"
  Then I press "Log in"
  Then I follow "Donors"
  And  I follow "More about Alex"
  And I fill in "Donation amount" with "25"
  Then I press "Add donation"
  Then I should see "Donation added!"
  
Scenario: delete donation
  Given I am viewing the home page
  When I follow "Log in"
  When I fill in "Email" with "example@railstutorial.org"
  When I fill in "Password" with "pw1234"
  Then I press "Log in"
  When I follow "Donors"
  When  I follow "More about Alex"
  When I fill in "Donation amount" with "25"
  Then I press "Add donation"
  Then I should see "Donation added!"
Feature: Sort Database
 
  As a Health for All Employee
  So I easily sift through the database
  I want to be able to sort by specific fields
  
Background: donor_profiles in database
  
  Given the following donor_profiles exist:
  | first_name   | last_name | donation_interests |
  | Alex         | Dubois    | Women's Health     |
  | Kyle         | Raney     | Women's Health     |
  | Vinnie       | Huang     | Senior Care        |
  | Kyle         | Zaney     | Children's Health  |
  
  Given the following users exist:
  | name  | email                        | password | admin  | activated  |
  | Alex  | example@railstutorial.org    | pw1234   | true   | true       |
  
Scenario: Sort by fields
  Given I am viewing the home page
  When I follow "Log in"
  When I fill in "Email" with "example@railstutorial.org"
  When I fill in "Password" with "pw1234"
  Then I press "Log in"
  When I follow "Donors"
  Then I follow "First Name"
  Then I should see "Alex"
  Then I follow "Last Name"
  Then I should see "Zaney"
  
 
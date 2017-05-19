Feature: login and view list of users
 
  As a user
  So that I may see who all is a user and an admin
  I want to be able to view a list of users
  
Background: donor_profiles in database
 
  Given the following donor_profiles exist:
  | first_name   | last_name |
  | Alex         | Dubois    |
  | Kyle         | Raney     |
  
  Given the following users exist:
  | name  | email                        | password | admin  | activated  |
  | Alex  | example@railstutorial.org    | pw1234   | true   | true       |
  
Scenario: view list of users
  Given I am viewing the home page
  When I follow "Log in"
  When I fill in "Email" with "example@railstutorial.org"
  When I fill in "Password" with "pw1234"
  Then I press "Log in"
  Then I should see "Alex"
  Then I should not see "Kyle"
  
Scenario: Invalid login
  Given I am viewing the home page
  When I follow "Log in"
  When I fill in "Email" with "example@railstutorial.org"
  When I fill in "Password" with "pw1235"
  Then I press "Log in"
  Then I should see "Invalid"
  
Scenario: Not logged in and try to view users
  Given I am viewing the home page
  Then I visit the users page
  Then I should see "Please log in."

Scenario: Remember password
  Given I am viewing the home page
  When I follow "Log in"
  When I fill in "Email" with "example@railstutorial.org"
  When I fill in "Password" with "pw1234"
  When I check "Remember me on this computer"
  Then I press "Log in"
  
Scenario: Log out
  Given I am viewing the home page
  When I follow "Log in"
  When I fill in "Email" with "example@railstutorial.org"
  When I fill in "Password" with "pw1234"
  Then I press "Log in"
  Then I follow "Log out"
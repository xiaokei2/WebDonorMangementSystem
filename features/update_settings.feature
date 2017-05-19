Feature: Update Settings
 
  As a user
  I want to be able to update my user settings
  So that I can keep my profile up to date
  
Background: donor_profiles in database
 
  Given the following donor_profiles exist:
  | first_name   | last_name |
  | Alex         | Dubois    |
  | Kyle         | Raney     |
  
  Given the following users exist:
  | name  | email                        | password | admin  | activated  |
  | Alex  | example@railstutorial.org    | pw1234   | true   | true       |

Scenario: Change Settings
  Given I am viewing the home page
  When I follow "Log in"
  When I fill in "Email" with "example@railstutorial.org"
  When I fill in "Password" with "pw1234"
  Then I press "Log in"
  Then I follow "Settings"
  When I fill in "Name" with "Alex1"
  When I fill in "Email" with "example@railstutorial.org"
  When I fill in "Password" with "pw1234"
  When I fill in "Confirmation" with "pw1234"
  Then I press "Save changes"
  Then I should see "Alex1"
  
Scenario: Incorrect Password when changing settings
  Given I am viewing the home page
  When I follow "Log in"
  When I fill in "Email" with "example@railstutorial.org"
  When I fill in "Password" with "pw1234"
  Then I press "Log in"
  Then I follow "Settings"
  When I fill in "Name" with "Kyle"
  When I fill in "Email" with "example@railstutorial.org"
  When I fill in "Password" with ""
  When I fill in "Confirmation" with ""
  Then I press "Save changes"
  Then I should see "Password is too short (minimum is 6 characters)"
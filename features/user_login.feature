Feature: User Logins
 
  As a user
  So that I may access otherwise hidden information
  I want to be able to have exclusive access


Background: donor_profiles in database
 
  Given the following donor_profiles exist:
  | first_name   | last_name |
  | Alex         | Dubois    |
  | Kyle         | Raney     |
  
  Given the following users exist:
  | name  | email                        | password | admin  | activated  |
  | Alex  | example@railstutorial.org    | pw1234   | true   | true       |
  | George| gtruong@gmail.com            | pw1234   | true   | false      |

Scenario: Log out
  Given I am viewing the home page
  When I follow "Log in"
  When I fill in "Email" with "example@railstutorial.org"
  When I fill in "Password" with "pw1234"
  Then I press "Log in"
  Then I follow "Log out"
  Then I should see "Log in"
  
Scenario: Invalid login
  Given I am viewing the home page
  When I follow "Log in"
  When I fill in "Email" with "example@railstutorial.org"
  When I fill in "Password" with "pw1235"
  Then I press "Log in"
  Then I should see "Invalid"
  
Scenario: User finished
  Given I am viewing the home page
  When I follow "Log in"
  Then I fill in "Email" with "gtruong@gmail.com"
  And I fill in "Password" with "pw1234"
  Then I press "Log in"
  Then I should see "Account not activated. Check your email for the activation link"
  
Scenario: Remember password
  Given I am viewing the home page
  When I follow "Log in"
  Then I fill in "Email" with "example@railstutorial.org"
  And I fill in "Password" with "pw1234"
  Then I check "Remember me on this computer"
  And I press "Log in"
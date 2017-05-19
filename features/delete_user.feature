Feature: delete user
 
  As a admin
  So I can get rid of accounts that need deletion
  I want to be able to delete a user profile
  
  
Background: users in database
 
  Given the following donor_profiles exist:
  | first_name   | last_name | 
  | Alex         | Dubois    |
  | Kyle         | Raney     |
  
  Given the following users exist:
  | name  | email                        | password | admin  | activated  |
  | Kyle  | example@railstutorial.org    | pw1234   | true   | true       |
  | Alex  | ghoz94@tamu.edu              | pw1234   | false  | true       |

@firefox
Scenario: delete user
  Given I am viewing the home page
  When I follow "Log in"
  Then I fill in "Email" with "example@railstutorial.org"
  And I fill in "Password" with "pw1234"
  Then I press "Log in"
  Then I follow "Users"
  And  I follow "[delete]"
  When I confirm popup
  Then I should not see "Alex"
  
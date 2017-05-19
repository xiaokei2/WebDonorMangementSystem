Feature: forgotten passowrd
 
  As an user
  So that I may keep my user account
  I want to be able to retrieve my password
  
Background: users in database
 
  Given the following users exist:
  | name    | email                      | password  | activated |
  | Alex    | ghoz94@tamu.edu            | pw1234    | true      |
  | Alex2   | alexdghozt0@gmail.com      | pw1234    | true      |

@firefox
Scenario: User forgot password
  Given I am viewing the home page
  When  I follow "Log in"
  And I follow "(forgot password)"
  And  I fill in "Email" with "ghoz94@tamu.edu"
  Then I press "Submit"
  Then I should see "Email sent with password reset instructions"
  Then "ghoz94@tamu.edu" should receive an email
  When I open the email
  Then I should see "Reset password" in the email body
  When I follow "Reset password" in the email
  Then I should see "Reset password"
  When I fill in "Password" with "pw1235"
  And I fill in "Confirmation" with "pw1235"
  Then I press "Update password"
  Then I should see "Password has been reset"
  
Scenario: User forgot password but puts in wrong email
  Given I am viewing the home page
  When  I follow "Log in"
  And I follow "(forgot password)"
  And  I fill in "Email" with "dummyemail@gmail.com"
  Then I press "Submit"
  Then I should see "Email address not found"
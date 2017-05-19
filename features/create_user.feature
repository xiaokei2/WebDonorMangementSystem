Feature: create donor profiles
 
  As a Health for All Employee
  So I log in and access donor profiles
  I want to be able to create a user profile

@firefox
Scenario: create new user profile, activate account, and test invalid link
  Given I am viewing the home page
  Then I follow "Sign up"
  And  I fill in "Name" with "Alex"
  And  I fill in "Email" with "ghoz94@tamu.edu"
  And  I fill in "Password" with "pw1234"
  And  I fill in "Confirmation" with "pw1234"
  Then I press "Create my account"
  Then I should see "Please check your email to activate your account."
  Then "ghoz94@tamu.edu" should receive an email
  When I open the email
  Then I should see "Activate" in the email body
  When I follow "Activate" in the email
  Then I should see "Account activated!"
  When I open the email
  Then I should see "Activate" in the email body
  When I follow "Activate" in the email
  Then I should see "Invalid activation link"
  
  
Scenario: incorrectly create new user profile
  Given I am viewing the home page
  Then I follow "Sign up"
  And  I fill in "Name" with "Alex"
  And  I fill in "Email" with "ghoz94@tamu.edu"
  And  I fill in "Password" with "pw1"
  And  I fill in "Confirmation" with "pw1"
  Then I press "Create my account"
  Then I should see "Password is too short (minimum is 6 characters)"
Feature: maintain donor profiles
 
  As an admin
  So that I may maintain my database
  I want to be able to edit and delete donor profiles

Background: donor_profiles in database

  Given the following donor_profiles exist:
  | first_name   | last_name |
  | Alex         | Dubois    |
  | Kyle         | Raney     |
  Given the following users exist:
  | name  | email                        | password | admin  | activated  |
  | Alex  | example@railstutorial.org    | pw1234   | true   | true       |  
Scenario: edit donor_profile
  Given I am viewing the home page
  When I follow "Log in"
  When I fill in "Email" with "example@railstutorial.org"
  When I fill in "Password" with "pw1234"
  Then I press "Log in"
  When I follow "Donors"
  When  I follow "More about Alex"
  And I follow "Edit"
  And  I fill in "Last Name" with "Du Bois"
  Then I press "Update Donor Info"
  Then I should see "Du Bois"
  And I follow "Back to donor profile list"
  Then I should see "Du Bois"

@firefox
Scenario: delete donor_profile 
  Given I am viewing the home page
  When I follow "Log in"
  When I fill in "Email" with "example@railstutorial.org"
  When I fill in "Password" with "pw1234"
  Then I press "Log in"
  When I follow "Donors"
  When  I follow "More about Kyle"
  And I follow "Delete"
  When I confirm popup
  Then I should see "DonorProfile 'Kyle' deleted."
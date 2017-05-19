Feature: view Health For All information
 
  As a donor
  So that I see what the organization is about
  I want to be able to view a list information about health for all
  
Scenario: view About information
  Given I am viewing the home page
  When I follow "About"
  Then I should see "Our Mission"
  
Scenario: view About information
  Given I am viewing the home page
  When I follow "Contact"
  Then I should see "3030 East 29th Street, Suite 111"
  
Scenario: view News
  Given I am viewing the home page
  When I follow "News"
  Then I should see "Health For All"
  
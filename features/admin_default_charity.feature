Feature: Admins can create and edit default charities
As an admin game creator
I want to be able to create and edit default charities
So that players trust that charities are real and donatable

Background:
    Given the following users exist:
            | username      | password | password_confirmation|     email             |   is_admin  |
            | Daniel        | lollolol |  lollolol            |  daniel@gmail.com     |     true    |
            | Joe           | password |  password            |  joe@gmail.com        |     false   |
    Given the following charities exist:
            |name| ein | description
            |charity1   | 492 | charity1 description

Scenario: Non-Admin cannot view existing default charities
  Given I am logged in as "joe@gmail.com" with password "password"
  When I go to the home page
  Then I should not see "Admin"
  

Scenario: Admin can view existing default charities
  Given I am logged in as "daniel@gmail.com" with password "lollolol"
  When I go to the home page
  When I press "admin_drop_down_button"
  Then I should see "Charities"
  When I follow "admin_charities_link"
  Then I should be on the charities page
  And I should see "charity1"
  
 
Scenario: Admin can create new default charities
  Given I am logged in as "daniel@gmail.com" with password "lollolol"
  When I go to the charities page
  When I follow "Create New Charity"
  Then I should be on the new charity page
  When I fill out the form with values "Charity Name": "New Charity", "ein": 123, "description": "charity description", "image url": "fakeurl.com", "charity link": "general link", "charity donation link": "donation link"
  When I press "Save New Charity"
  Then I should be on the charities page
  When I follow "New Charity" 
  Then I should see "New Charity"
  Then I should see "fakeurl.com"
  

Scenario: Admin can edit existing default charities 
  Given I am logged in as "daniel@gmail.com" with password "lollolol"
  When I go to the charities page
  Then I follow "charity1"
  Then I should be on the edit charity page for "charity1"
  When I fill out the form with values "Charity Name": "New Charity", "description": "new description"
  When I press "Save Charity"
  Then I should be on the charities page
  And I should see "New Charity"
  When I follow "New Charity" 
  Then I should see "New Charity"
  Then I should see "new description"
  Then I should see "492"
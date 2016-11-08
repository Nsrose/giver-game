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
            |name       | ein | description           |donation_link  |
            |charity1   | 492 | charity1 description  |link           |

Scenario: Non-Admin cannot view existing default charities
  Given I am logged in as "joe@gmail.com" with password "password"
  When I go to the home page
  Then I should not see "Admin"
  When I go to the charities page
  Then I should see "Only Administrators can create charities"
  

Scenario: Admin can view existing default charities
  Given I am logged in as "daniel@gmail.com" with password "lollolol"
  When I go to the home page
  When I follow "Charities" from the admin dropdown menu in the navbar
  Then I should be on the charities page
  And I should see "charity1"
  
Scenario: Admin must fill out charity name, ein, description, and donation link
  Given I am logged in as "daniel@gmail.com" with password "lollolol"
  When I go to the charities page
  When I follow "Create New Charity"
  When I press "Submit"
  Then I should see "Name can't be blank"
  And I should see "Ein can't be blank"
  And I should see "Donation link can't be blank"
  And I should be on the new charity page


Scenario: Admin can create new default charities
  Given I am logged in as "daniel@gmail.com" with password "lollolol"
  When I go to the charities page
  When I follow "Create New Charity"
  Then I should be on the new charity page
  When I fill out the form with values "Title": "New Charity","Description": "charity description","ein": "123","image_link": "https://www.google.com/images/nav_logo242_hr.png","homepage_link": "https://www.google.com","donation_link": "https://www.google.com"
  When I press "Submit"
  Then I should be on the charities page
  Then I should see "New Charity was Successfully Created."
  When I follow "New Charity" 
  Then I should see "New Charity"
  Then I should see the input text "https://www.google.com"
  
Scenario: Admin cannot create a default charity with an image_link with the wrong extension
  Given I am logged in as "daniel@gmail.com" with password "lollolol"
  When I go to the new charity page
  When I fill out the form with values "Title": "New Charity","Description": "charity description","ein": "123","image_link": "jeffnash.net/JeffNashResume.pdf","homepage_link": "https://www.google.com","donation_link": "https://www.google.com"
  When I press "Submit"
  Then I should see "image url has the wrong extension"
  And I should be on the new charity page
  
Scenario: Admin cannot create a default charity with invalid image, charity homepage, and charity donation page. 
  Given I am logged in as "daniel@gmail.com" with password "lollolol"
  When I go to the new charity page
  When I fill out the form with values "Title": "New Charity","Description": "charity description","ein": "123","image_link": "fake_url.com","homepage_link": "fake_url.com","donation_link": "fake_url.com"
  When I press "Submit"
  Then I should see "The image url cannot be found"
  Then I should see "The home page url cannot be found"
  Then I should see "The donation page url cannot be found"
  And I should be on the new charity page

Scenario: Admin can edit existing default charities 
  Given I am logged in as "daniel@gmail.com" with password "lollolol"
  When I go to the charities page
  Then I follow "charity1"
  Then I should be on the edit charity page for "charity1"
  When I fill out the form with values "Title": "New Charity","Description": "new description"
  When I press "Submit Changes"
  Then I should be on the charities page
  Then I should see "New Charity was Successfully Updated."
  And I should see "New Charity"
  When I follow "New Charity" 
  Then I should see "New Charity"
  Then I should see "new description"
  Then I should see the input text "492"
  
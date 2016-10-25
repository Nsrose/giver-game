Feature:  Access Admin Accounts
  As an administrator on the website
  So that I can haz special privileges
  I want to be able to login as a admin

  Background: Users exist

    Given the following users exist:
      | username      | password | password_confirmation|     email             |   is_admin  |
      | Daniel        | lollolol |  lollolol            |  daniel@gmail.com     |     true    |
      | Joe           | password |  password            |  joe@gmail.com        |     false   |

    Scenario: Log in in to an admin account
      Given I am logged in as "daniel@gmail.com" with password "lollolol"
      When I go to the user page for "daniel@gmail.com"
      Then I should see "Profile [Administrator]"

    Scenario: Log in to a regular account
      Given I am logged in as "joe@gmail.com" with password "password"
      When I go to the user page for "daniel@gmail.com"
      Then I should not see "Profile [Administrator]"
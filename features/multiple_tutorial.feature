Feature: Play and choose from multiple tutorials
  As a new user
  So that I can see and learn from different examples of giving games
  I would like to see and pick from a menu of Tutorial games

  Background: Populate tutorials 
    Given the following games exist:
    | title                   | description                                 | charityA_title | charityB_title | tutorial | show_results |resource_id|
    | Tutorial                | 'This is the tutorial for the Giving Game'  | Charity A      | Charity B      | true     | true         |1          |
    | Tutorial 2              | 'This is another tutorial!'                 | Charity 1      | Charity 2      | true     | true         |2          |

    Scenario: Select and play from multiple tutorials
      Given I am on the home page
      When I follow "Tutorial" from the dropdown menu in the navbar
      Then The tutorial titled "Tutorial" should be there
      Given I am on the home page
      When I follow "Tutorial 2" from the dropdown menu in the navbar
      Then The tutorial titled "Tutorial 2" should be there




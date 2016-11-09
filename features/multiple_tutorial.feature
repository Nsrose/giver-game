Feature: Play and choose from multiple tutorials
  As a new user
  So that I can see and learn from different examples of giving games
  I would like to see and pick from a menu of Tutorial games

  Background: Populate tutorials 
    Given some charities exist
    Given the following games exist:
    | title                   | description                                 | tutorial | show_results |resource_id|charity_a_id     |charity_b_id|
    | Tutorial                | 'This is the tutorial for the Giving Game'  | true     | true         |1          |2                |4               |
    | Tutorial 2              | 'This is another tutorial!'                 | true     | true         |2          |1                |4               |

    Scenario: Select and play from multiple tutorials
      Given I am on the home page
      When I follow "Tutorial" from the tutorial dropdown menu in the navbar
      Then The tutorial titled "Tutorial" should be there
      Given I am on the home page
      When I follow "Tutorial 2" from the tutorial dropdown menu in the navbar
      Then The tutorial titled "Tutorial 2" should be there




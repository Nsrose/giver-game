Feature: Play a tutorial
  As a new user who wants to play
  I want to be able to learn how to play the giving game through the tutorial
  So that I can understand the concept of the game and start donating
  
  Background: tutorial exists 
    Given I am on the home page
    Given some charities exist
    And the following games exist:
    | title        | id | description                                 | tutorial | show_results | resource_id | charity_a_id  |charity_b_id|
    | Tutorial     |  1 | 'This is the tutorial for the Giving Game'  | true     | true         | 1           |1              |4                |
  
  Scenario: Go to the tutorial page
    When I follow "home_tutorial"
    Then I should be on the game page for "Tutorial"

  Scenario: Play the sample game
    When I follow "home_tutorial"
    And The game "Tutorial" should be able to show results
    And I press "Donate to Against Malaria Foundation"
    Then I should be on the results page for "Tutorial"
  


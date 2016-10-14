Feature: Play a tutorial
  As a new user who wants to play
  I want to be able to learn how to play the giving game through the tutorial
  So that I can understand the concept of the game and start donating
  
  Background: tutorial exists 
    Given I am on the home page
    And the following games exist:
    | title        | id | description                                 | charityA_title | charityB_title | tutorial | show_results | resource_id |
    | Tutorial     |  1 | 'This is the tutorial for the Giving Game'  | Charity A      | Charity B      | true     | true         | 1           |
  
  Scenario: Go to the tutorial page
    When I follow "home_tutorial"
    Then I should be on the game page for "Tutorial"

  Scenario: Play the sample game
    When I follow "home_tutorial"
    And The game "Tutorial" should be able to show results
    And I press "Donate to Charity A"
    Then I should be on the results page for "Tutorial"
    And I should see "Leading Charity: Charity A"


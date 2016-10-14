Feature: Tutorial and playing options
  As a user
  I want to have the option to be able to learn about the game, play an existing game, or create my own game
  So that I can easily navigate through the site, learn about charities, and choose how to go about a giving game

  Background:
    Given the following users exist:
    | username            | password   | password_confirmation  |     email             |
    | Traitor_JOSEPHINE   | TRAITORJOE |  TRAITORJOE            |  j0e@tr8er.org        |
    
    And the following games exist: # features/step_definitions/tutorial_steps.rb:1
      | title    | description                                | charityA_title | charityB_title | tutorial | resource_id |
      | Tutorial | 'This is the tutorial for the Giving Game' | Charity A      | Charity B      | true     | 1           |

  Scenario: Clicking on the Tutorial link should direct users to the tutorial
    Given I am on the home page
    Then I should see "Play Tutorial" 
    When I follow "home_tutorial"
    Then I should be on the tutorial page

  Scenario: Clicking on the play a game link should direct users to a list of existing games
    Given I am on the home page
    Then I should see "Play a giving game" 
    When I follow "Play a giving game"
    Then I should be on the existing games page

  Scenario: Clicking on the create a new game link should direct users to a page with the option to start a new game
    Given I am on the home page
    Then I should see "Create New Game" 
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I follow "Create New Game"
    Then I should be on the new games page


Feature: As a user who wants to play
  So that I can learn about charities and choose to donate from among many games
  I want to select a game among the current active games and play
  
  Background:  
    Given I am on the home page
    Given some charities exist
    Given some games and some users exist

  Scenario: Go to the games page and select a game 
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I follow "Play a giving game"
    And I should be on the existing games page
    Then I should see "Game 1" in my table
    When I follow "Game 1" in my table
    Then I should be on the game page for "Game 1"
    And I should see "This is a game"
    
  Scenario: Go back to existing games page from game page 
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I follow "Play a giving game"
    And I follow "Game 1" in my table
    And The game "Game 1" should be able to show results
    And I press "Donate to GiveDirectly"
    And I should be on the results page for "Game 1"
    When I follow "Go to Games List"
    Then I should be on the existing games page
    
  Scenario: A user should only be able to play a game once
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I follow "Play a giving game"
    And I follow "Game 1" in my table
    And The game "Game 1" should be able to show results
    And I press "Donate to GiveDirectly"
    And I should be on the results page for "Game 1"
    When I follow "Go to Games List"
    And I follow "Game 1" in my table
    And I press "Donate to GiveDirectly"
    Then I should be on the existing games page
    And I should see "You have already played that game"

  Scenario: Only users should be able to play a game
    When I follow "Play a giving game"
    And I follow "Game 1" in my table
    Then I should be on the sign in page
  
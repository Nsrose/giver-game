Feature: Display votes
  As a user who has created a giving game
  So that I can see the vote counts of the giving game
  I would like to be able to see the giving games display vote counts after a player votes
 
  Background: games exist
    Given some charities exist
    Given I am on the home page
    Given some games and some users exist
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    
  Scenario: Select game and vote
    When I follow "Play a giving game"
    And I should be on the existing games page
    Then I should see "Game 1" in my table
    And The game "Game 1" should be able to show results
    When I follow "Game 1" in my table
    Then I should be on the game page for "Game 1"
    And I press "Donate to GiveDirectly"
    Then I should be on the results page for "Game 1"
    And I should see "GiveDirectly $1.00"

  Scenario: Selecting one charity and confirming the votes for the other charity did not increase
    When I follow "Play a giving game"
    And I should be on the existing games page
    Then I should see "Game 1" in my table
    And The game "Game 1" should be able to show results
    When I follow "Game 1" in my table
    And I press "Donate to Against Malaria Foundation"
    Then I should be on the results page for "Game 1"
    And I should see "GiveDirectly $0.00"

  Scenario: Should not be able to view results if the option is not selected
    When I follow "Play a giving game"
    And I should be on the existing games page
    Then I should see "Game 2" in my table
    And The game "Game 2" should not be able to show results
    When I follow "Game 2" in my table
    And I press "Donate to Deworm the World Initiative"
    Then I should be on the existing games page

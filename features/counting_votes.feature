Feature: Display votes
  As a user who has created a giving game
  So that I can see the vote counts of the giving game
  I would like to be able to see the giving games display vote counts after a player votes
 
  Background: games exist
    Given I am on the home page
    And the following games exist:
    | title                   | description                                 | charityA_title | charityB_title | votesA | votesB | tutorial | show_results | resource_id |
    | TutorialGame            | 'This is the tutorial for the Giving Game'  | Charity A      | Charity B      | 0      | 0      | true     | true         | 1           |
    | NoShow                  | 'This is a game without showing results on' | Charity A      | Charity B      | 100    | 0      | false    | false        | 2           |
    And the following users exist:
    | username           | password   | password_confirmation  |     email             |
    | Traitor_JOSEPHINE   | TRAITORJOE |  TRAITORJOE            |  j0e@tr8er.org        |
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    
  Scenario: Select game and vote
    When I follow "Play a giving game"
    And I should be on the existing games page
    Then I should see "TutorialGame" in my table
    And The game "TutorialGame" should be able to show results
    When I follow "TutorialGame" in my table
    Then I should be on the game page for "TutorialGame"
    And I press "Donate to Charity A"
    Then I should be on the results page for "TutorialGame"
    And I should see "Votes for Charity A: 1"

  Scenario: Selecting one charity and confirming the votes for the other charity did not increase
    When I follow "Play a giving game"
    And I should be on the existing games page
    Then I should see "TutorialGame" in my table
    And The game "TutorialGame" should be able to show results
    When I follow "TutorialGame" in my table
    And I press "Donate to Charity A"
    Then I should be on the results page for "TutorialGame"
    And I should see "Votes for Charity B: 0"

  Scenario: Should not be able to view results if the option is not selected
    When I follow "Play a giving game"
    And I should be on the existing games page
    Then I should see "NoShow" in my table
    And The game "NoShow" should not be able to show results
    When I follow "NoShow" in my table
    And I press "Donate to Charity A"
    Then I should be on the existing games page

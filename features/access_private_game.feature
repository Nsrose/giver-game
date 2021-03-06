Feature: Create a new game
  As a game player
  So that I can play private giver games
  I want to be able to access private giver games

  Background:
    Given some charities exist
    Given the following games exist:
    | title       | description                                | per_transaction |  is_private | resource_id|charity_a_id     |charity_b_id     |
    | Secret game | something something                        |      10         | true        | 1abc       |1                |4                |
    | Public game | something something else                   |      1          | false       | 1          |1                |4                |
  
    Given the following users exist:
    | username           | password   | password_confirmation  |     email             |
    | Traitor_JOSEPHINE   | TRAITORJOE |  TRAITORJOE            |  j0e@tr8er.org        |

  Scenario: I try to visit the play page for a private game
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    Given I visit the url /games/play/1abc
    Then I should see "Play the game: Secret game"
  Scenario: I try to visit a private game's results
    Given I visit the url /games/results/1abc
    Then I should see "Results: Secret game"
    
  Scenario: I go to the public "play game" page
    Given I go to the existing games page
    Then I should see "Public game"
    Then I should not see "Secret game"
    Then I should see only "1" game
